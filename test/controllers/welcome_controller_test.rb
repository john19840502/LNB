require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get why_lnb" do
    get :why_lnb
    assert_response :success
  end

  test "should get how_lnb" do
    get :how_lnb
    assert_response :success
  end

  test "should get about_lnb" do
    get :about_lnb
    assert_response :success
  end

end
