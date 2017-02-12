require 'test_helper'

class BlackScholesControllerTest < ActionController::TestCase
  setup do
    @black_schole = black_scholes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:black_scholes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create black_schole" do
    assert_difference('BlackSchole.count') do
      post :create, black_schole: { call_put_flag: @black_schole.call_put_flag, interest_rate: @black_schole.interest_rate, stock_price: @black_schole.stock_price, strike_price: @black_schole.strike_price, time: @black_schole.time, volatility: @black_schole.volatility }
    end

    assert_redirected_to black_schole_path(assigns(:black_schole))
  end

  test "should show black_schole" do
    get :show, id: @black_schole
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @black_schole
    assert_response :success
  end

  test "should update black_schole" do
    patch :update, id: @black_schole, black_schole: { call_put_flag: @black_schole.call_put_flag, interest_rate: @black_schole.interest_rate, stock_price: @black_schole.stock_price, strike_price: @black_schole.strike_price, time: @black_schole.time, volatility: @black_schole.volatility }
    assert_redirected_to black_schole_path(assigns(:black_schole))
  end

  test "should destroy black_schole" do
    assert_difference('BlackSchole.count', -1) do
      delete :destroy, id: @black_schole
    end

    assert_redirected_to black_scholes_path
  end
end
