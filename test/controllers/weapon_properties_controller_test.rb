require 'test_helper'

class WeaponPropertiesControllerTest < ActionController::TestCase
  setup do
    @weapon_property = weapon_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weapon_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weapon_property" do
    assert_difference('WeaponProperty.count') do
      post :create, weapon_property: {  }
    end

    assert_redirected_to weapon_property_path(assigns(:weapon_property))
  end

  test "should show weapon_property" do
    get :show, id: @weapon_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weapon_property
    assert_response :success
  end

  test "should update weapon_property" do
    patch :update, id: @weapon_property, weapon_property: {  }
    assert_redirected_to weapon_property_path(assigns(:weapon_property))
  end

  test "should destroy weapon_property" do
    assert_difference('WeaponProperty.count', -1) do
      delete :destroy, id: @weapon_property
    end

    assert_redirected_to weapon_properties_path
  end
end
