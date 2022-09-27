class AccountsController < ApplicationController

  before_action :authenticate_user! 
  
  before_action :set_account, only: %i[ show edit update ]
  
  def show
  end

  def edit
  end

  def update

    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "account was successfully updated."}
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end

  end

  private

    def set_account
      @account = (current_user.account ||= Account.create())
    end

    def account_params
      params.require(:account).permit(:avatar, :username, :nickname, :birth)
    end

end