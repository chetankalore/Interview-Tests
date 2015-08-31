class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    account = Account.where("account_number = ?", params[:account_number]).first    
    deposit_amount = params[:deposit_amount].to_f    

    if (account && account.balance >= deposit_amount)
      deposit = Deposit.new
      deposit.account_id = account.id
      deposit.user_id = account.user_id

      tenure_in_years = params[:tenure_in_years].first
      tenure_in_months = params[:tenure_in_months].first
      tenure_in_days = params[:tenure_in_days].first

      deposit.tenure_in_years = tenure_in_years
      deposit.tenure_in_months = tenure_in_months
      deposit.tenure_in_days = tenure_in_days
      deposit.maturity_proceeds = params[:maturity_proceeds].present? ? params[:maturity_proceeds] : 0

      deposit.save

      user_age = account.user.age rescue 0

      # This is to calculate the rate of interest.
      #interest = deposit.calculate_interest(tenure_in_years, tenure_in_months, tenure_in_days, user_age)
      #deposit.update(:interest => interest)

      balance = (account.balance - deposit_amount)
      account.update(:balance => balance)
    else
      flash[:error] = "Account doesn't exsits / balance is less. Please try again."
      redirect_to new_account_path
    end
    flash[:message]= "Amount is deposited successfully."
    redirect_to new_account_path
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:account_number, :user_id, :type_account, :tenure_in_years, :tenure_in_months, :tenure_in_days, :maturity_proceeds)
    end
end
