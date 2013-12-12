require 'test_helper'

class AuditionsControllerTest < ActionController::TestCase
  setup do
    @audition = auditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audition" do
    assert_difference('Audition.count') do
      post :create, audition: { audition_date: @audition.audition_date, company_id: @audition.company_id, description: @audition.description, name: @audition.name, post_date: @audition.post_date }
    end

    assert_redirected_to audition_path(assigns(:audition))
  end

  test "should show audition" do
    get :show, id: @audition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audition
    assert_response :success
  end

  test "should update audition" do
    patch :update, id: @audition, audition: { audition_date: @audition.audition_date, company_id: @audition.company_id, description: @audition.description, name: @audition.name, post_date: @audition.post_date }
    assert_redirected_to audition_path(assigns(:audition))
  end

  test "should destroy audition" do
    assert_difference('Audition.count', -1) do
      delete :destroy, id: @audition
    end

    assert_redirected_to auditions_path
  end
end
