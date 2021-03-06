module ShopifyCli
  module Tasks
    class UpdateDashboardURLS < ShopifyCli::Task
      NGROK_REGEX = /https:\/\/([a-z0-9\-]+\.ngrok\.io)(.*)/

      def call(ctx, url:, callback_url:)
        @ctx = ctx
        project = ShopifyCli::Project.current
        api_key = project.env.api_key
        result = ShopifyCli::PartnersAPI.query(ctx, 'get_app_urls', apiKey: api_key)
        app = result['data']['app']
        new_url = "#{url}/shopify"
        consent = check_application_url(app['applicationUrl'], new_url)
        constructed_urls = construct_redirect_urls(app['redirectUrlWhitelist'], url, callback_url)
        return if new_url == app['applicationUrl']
        ShopifyCli::PartnersAPI.query(@ctx, 'update_dashboard_urls', input: {
          applicationUrl: consent ? new_url : app['applicationUrl'],
          redirectUrlWhitelist: constructed_urls, apiKey: api_key
        })
        @ctx.puts(@ctx.message('core.tasks.update_dashboard_urls.updated'))
      rescue
        @ctx.puts(@ctx.message('core.tasks.update_dashboard_urls.update_error', ShopifyCli::TOOL_NAME))
        raise
      end

      def check_application_url(application_url, new_url)
        return false if application_url.match(new_url)
        CLI::UI::Prompt.confirm(@ctx.message('core.tasks.update_dashboard_urls.update_prompt'))
      end

      def construct_redirect_urls(urls, new_url, callback_url)
        urls.map do |url|
          if (match = url.match(NGROK_REGEX))
            "#{new_url}#{match[2]}"
          else
            url
          end
        end
        if urls.grep(/#{new_url}#{callback_url}/).empty?
          urls.push("#{new_url}#{callback_url}")
        end
      end
    end
  end
end
