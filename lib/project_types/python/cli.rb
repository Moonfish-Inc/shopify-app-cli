# frozen_string_literal: true
module Python
  class Project < ShopifyCli::ProjectType
    creator 'Python App', 'Python::Commands::Create'

    register_command('Python::Commands::Serve', "serve")
    register_command('Python::Commands::Tunnel', "tunnel")

    require Project.project_filepath('messages/messages')
    register_messages(Python::Messages::MESSAGES)
  end

  # define/autoload project specific Commands
  module Commands
    autoload :Serve, Project.project_filepath('commands/serve')
    autoload :Tunnel, Project.project_filepath('commands/tunnel')
  end

  # define/autoload project specific Tasks
  module Tasks
  end

  # define/autoload project specific Forms
  module Forms
  end
end
