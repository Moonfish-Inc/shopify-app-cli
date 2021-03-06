# frozen_string_literal: true

module Script
  module Forms
    class Push < ScriptForm
      flag_arguments :api_key, :force

      def ask
        self.api_key ||= ask_api_key
      end

      private

      def ask_api_key
        ask_app_api_key(organization['apps'])
      end
    end
  end
end
