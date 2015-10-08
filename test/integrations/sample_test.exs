defmodule PhoenixPractice.SampleTest do
  use PhoenixPractice.ConnCase

  use Hound.Helpers

  hound_session

  test "GET /" do
    navigate_to "/"
    assert page_source =~ "Welcome to Phoenix"
  end
end
