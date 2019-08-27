require 'test_helper'

class Doctor::OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_offers_index_url
    assert_response :success
  end

  test "should get create" do
    get doctor_offers_create_url
    assert_response :success
  end

  test "should get new" do
    get doctor_offers_new_url
    assert_response :success
  end

  test "should get destroy" do
    get doctor_offers_destroy_url
    assert_response :success
  end

end
