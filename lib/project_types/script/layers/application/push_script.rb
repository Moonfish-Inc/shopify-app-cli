# frozen_string_literal: true

module Script
  module Layers
    module Application
      class PushScript
        class << self
          def call(ctx:, language:, extension_point_type:, script_name:, source_file:, api_key:, force:)
            script = Infrastructure::ScriptRepository.new.get_script(language, extension_point_type, script_name)
            task_runner = Infrastructure::TaskRunner.for(ctx, language, script_name, source_file)
            ProjectDependencies.install(ctx: ctx, task_runner: task_runner)
            BuildScript.call(ctx: ctx, task_runner: task_runner, script: script)
            push_script(ctx, task_runner, script, api_key, force)
          end

          private

          def push_script(ctx, task_runner, script, api_key, force)
            Infrastructure::PushPackageRepository.new
              .get_push_package(script, task_runner.compiled_type)
              .push(Infrastructure::ScriptService.new(ctx: ctx), api_key, force)
            ctx.puts(ctx.message('script.application.pushed'))
          end
        end
      end
    end
  end
end
