require 'test_helper'

class SeleniumTest < ActionDispatch::SystemTestCase

  if ENV.key?("APP_HOST")
    puts "running in container, using remote selenium"

    driven_by :selenium,
      using: :firefox,
      options: {
        url: "http://#{ENV.fetch("SELENIUM_REMOTE_HOST")}:4444/wd/hub"
      }
    Capybara.register_server :puma do |app, port, host|
      require 'rack/handler/puma'
      Rack::Handler::Puma.run(app, Host: '0.0.0.0', Port: port, Threads: "0:4")
    end
  else
    puts "running outside container, using local firefox"
    driven_by :selenium, using: :firefox
  end

  def test_selenium
    if ENV.key?("APP_HOST")
      Capybara.app_host = "http://#{ENV.fetch("APP_HOST")}:#{Capybara.current_session.server.port}"
    end

    Capybara.visit("/")
    assert_equal [true]*3, Capybara.page.all('input').map(&:checked?)
  end
end
