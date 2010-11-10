require 'test_helper'

class SeducsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seducs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seduc" do
    assert_difference('Seduc.count') do
      post :create, :seduc => { }
    end

    assert_redirected_to seduc_path(assigns(:seduc))
  end

  test "should show seduc" do
    get :show, :id => seducs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => seducs(:one).id
    assert_response :success
  end

  test "should update seduc" do
    put :update, :id => seducs(:one).id, :seduc => { }
    assert_redirected_to seduc_path(assigns(:seduc))
  end

  test "should destroy seduc" do
    assert_difference('Seduc.count', -1) do
      delete :destroy, :id => seducs(:one).id
    end

    assert_redirected_to seducs_path
  end
end
