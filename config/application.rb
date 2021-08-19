require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pictgram
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
      # Railsはサーバ起動時にフォルダやファイルが一括して読み込まれる設定になっているが、作成したapp/uploadersというフォルダに関しては対象にならないので、
      # 読み込まれるようにconfig.autoload_pathsという設定ファイルにフォルダ名を追加している。Path : app/uploaders を示している。
      config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
