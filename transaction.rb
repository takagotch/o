#AccountTransaction.transaction do
#
#  DepositsAndWithdrawal.transaction do
#
#    BasicIncomeAccount.transaction do
#

class AccountTransactionController < ApplicationController
	
	def new
		@account_transaction = AccountTansaction.new
	end

	def create
	
	AccountTransaction do
   	  @account_transaction = AccountTransaction.new(
	     withdrawal_account_id: current_user.basic_income_account.id,
	     deposit_account_id: BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id]).id,
	     amount: params[:account_transactoin][:amount]
		)
	  @account_transaction.save!
	end

	DepositAndWithdrawal.transaction do
	  @account_transaction.deposits_and_withdrawals.build(
	  transaction_type: "withdraw",
	  basic_income_account_id: current_user.basic_income_account.id,
	  amount: -1 * params[:account_transaction][:amount].to_f
		)
	  @account_transaction.save!

	  @account_transaction.deposits_and_withdrawals.build(
	  transaction_type: "deposit",
	  basic_income_account_id: BaseicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id]).id,
	  amount: prams[:account_transaction][:amount].to_f
	  )

	end

	BasicIncomeAccount.transaction do
	  @withdrawal_basic_income_account = current_user.basic_income_account #withdraw_account
	  @deposit_basic_income_account = BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id])
	  @amount = params[:accunt_transaction][:amount].to_f
	  
	  @withdrawal_basic_income_account.update(balance: @withdrawal_basic_income_account.balance - @amount)
	  @deposit_basic_income_account.update(balance: @deposit_basic_income_account.balance + @amount)
	end
	end
	redirect_to root_path #succes => home
rescue => e
	render plain: e.message

	end

private
def account_transaction_params
	params.require(:account_transaction).permit(:deposit_account_id, :amount)
end
end



