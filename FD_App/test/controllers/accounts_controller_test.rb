require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { account_number: @account.account_number, maturity_proceeds: @account.maturity_proceeds, tenure_in_days: @account.tenure_in_days, tenure_in_months: @account.tenure_in_months, tenure_in_years: @account.tenure_in_years, type_account: @account.type_account, user_id: @account.user_id }
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    patch :update, id: @account, account: { account_number: @account.account_number, maturity_proceeds: @account.maturity_proceeds, tenure_in_days: @account.tenure_in_days, tenure_in_months: @account.tenure_in_months, tenure_in_years: @account.tenure_in_years, type_account: @account.type_account, user_id: @account.user_id }
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to accounts_path
  end
end
