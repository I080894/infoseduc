require 'test_helper'

class LaboratoriosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laboratorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laboratorios" do
    assert_difference('Laboratorios.count') do
      post :create, :laboratorios => { }
    end

    assert_redirected_to laboratorios_path(assigns(:laboratorios))
  end

  test "should show laboratorios" do
    get :show, :id => laboratorios(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => laboratorios(:one).id
    assert_response :success
  end

  test "should update laboratorios" do
    put :update, :id => laboratorios(:one).id, :laboratorios => { }
    assert_redirected_to laboratorios_path(assigns(:laboratorios))
  end

  test "should destroy laboratorios" do
    assert_difference('Laboratorios.count', -1) do
      delete :destroy, :id => laboratorios(:one).id
    end

    assert_redirected_to laboratorios_path
  end
end
