require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium,
    # remove these options to test locally
    # options: {url: "http://selenium:4444/wd/hub"},
    using: :firefox,
    screen_size: [1400, 1400]
end
