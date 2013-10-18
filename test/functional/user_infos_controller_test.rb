require 'test_helper'

class UserInfosControllerTest < ActionController::TestCase
  setup do
    @user_info = user_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_info" do
    assert_difference('UserInfo.count') do
      post :create, user_info: { address: @user_info.address, is_admin: @user_info.is_admin, is_trusted: @user_info.is_trusted, proof_id: @user_info.proof_id, proof_type_id: @user_info.proof_type_id }
    end

    assert_redirected_to user_info_path(assigns(:user_info))
  end

  test "should show user_info" do
    get :show, id: @user_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_info
    assert_response :success
  end

  test "should update user_info" do
    put :update, id: @user_info, user_info: { address: @user_info.address, is_admin: @user_info.is_admin, is_trusted: @user_info.is_trusted, proof_id: @user_info.proof_id, proof_type_id: @user_info.proof_type_id }
    assert_redirected_to user_info_path(assigns(:user_info))
  end

  test "should destroy user_info" do
    assert_difference('UserInfo.count', -1) do
      delete :destroy, id: @user_info
    end

    assert_redirected_to user_infos_path
  end
end
