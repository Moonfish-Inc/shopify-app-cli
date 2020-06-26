# frozen_string_literal: true
module Python
  module Commands
    class Serve < ShopifyCli::Command
      prerequisite_task :ensure_env, :ensure_dev_store

      options do |parser, flags|
        parser.on('--host=HOST') do |h|
          flags[:host] = h.gsub('"', '')
        end
      end

      def call(*)
        project = ShopifyCli::Project.current
        url = options.flags[:host] || ShopifyCli::Tunnel.start(@ctx)
        @ctx.abort(@ctx.message('python.serve.error.host_must_be_https')) if url.match(/^https/i).nil?
        project.env.update(@ctx, :host, url)
        ShopifyCli::Tasks::UpdateDashboardURLS.call(
          @ctx,
          url: url,
          callback_url: "/shopify/auth/callback",
        )
        if @ctx.mac? && project.env.shop
          @ctx.open_url!("#{project.env.host}/shopify/auth?shop=#{project.env.shop}")
        end
      end

      def self.help
        ShopifyCli::Context.message('python.serve.help', ShopifyCli::TOOL_NAME)
      end

      def self.extended_help
        ShopifyCli::Context.message('python.serve.extended_help')
      end
    end
  end
end

