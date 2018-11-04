require "application_system_test_case"

class ProxiesTest < ApplicationSystemTestCase
  setup do
    @proxy = proxies(:one)
  end

  test "visiting the index" do
    visit proxies_url
    assert_selector "h1", text: "Proxies"
  end

  test "creating a Proxy" do
    visit proxies_url
    click_on "New Proxy"

    click_on "Create Proxy"

    assert_text "Proxy was successfully created"
    click_on "Back"
  end

  test "updating a Proxy" do
    visit proxies_url
    click_on "Edit", match: :first

    click_on "Update Proxy"

    assert_text "Proxy was successfully updated"
    click_on "Back"
  end

  test "destroying a Proxy" do
    visit proxies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proxy was successfully destroyed"
  end
end
