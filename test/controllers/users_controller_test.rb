require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_url, params: { user: { email: @user.email, name: @user.name, password: @user.password, role: @user.role} }
  #   end
  #   assert_redirected_to user_url(User.last)
  # end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  # test "should update user" do
  #   patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password: @user.password, role: @user.role } }
  #   assert_redirected_to user_path(@user)
  # end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
  
  # test "should redirect edit when not logged in" do
  #   get edit_user_path(@user)
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end

  # test "should redirect update when not logged in" do
  #   patch user_path(@user), params: { user: { name: @user.name,
  #                                             email: @user.email } }
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end
end
