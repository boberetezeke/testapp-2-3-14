require 'test_helper'

class WidgetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:widgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create widget" do
    assert_difference('Widget.count') do
      post :create, :widget => { }
    end

    assert_redirected_to widget_path(assigns(:widget))
  end

  test "should show widget" do
    get :show, :id => widgets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => widgets(:one).to_param
    assert_response :success
  end

  test "should update widget" do
    put :update, :id => widgets(:one).to_param, :widget => { }
    assert_redirected_to widget_path(assigns(:widget))
  end

  test "should destroy widget" do
    assert_difference('Widget.count', -1) do
      delete :destroy, :id => widgets(:one).to_param
    end

    assert_redirected_to widgets_path
  end
end
