require 'test_helper'

class Doctor::ConsultationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_consultations_index_url
    assert_response :success
  end

  test "should get update" do
    get doctor_consultations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get doctor_consultations_destroy_url
    assert_response :success
  end

end
