class AccountTransactionsController < ApplicationController

  #取引を作成する 
  def new
    @account_transaction = AccountTransaction.new
  end

  #3つのモデルを更新する処理
  def create
　　#一つ目のモデルAccountTransactionを更新
    AccountTransaction.transaction do
      @account_transaction = AccountTransaction.new(        
        withdrawal_account_id: current_user.basic_income_account.id,
        deposit_account_id: BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id]).id,
        amount: params[:account_transaction][:amount]
        )
      @account_transaction.save!
      #２つ目のモデルDepositsAndWithdrawalを更新
      DepositsAndWithdrawal.transaction do
        #出金側レコードを作成保存
        @account_transaction.deposits_and_withdrawals.build(
          transaction_type: "出金",
          basic_income_account_id: current_user.basic_income_account.id,
          amount: -1 * params[:account_transaction][:amount].to_f
          )
        @account_transaction.save!
        #出金側レコードを作成保存
        @account_transaction.deposits_and_withdrawals.build(
          transaction_type: "入金",
          basic_income_account_id: BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id]).id,
          amount: params[:account_transaction][:amount].to_f
          )
        @account_transaction.save!
        #３つ目のモデルBasicIncomeAccount（口座）を更新
        BasicIncomeAccount.transaction do
          @withdrawal_basic_income_account = current_user.basic_income_account#出金口座
          @deposit_basic_income_account = BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id])#入金口座       
          #取引額を代入する
          @amount = params[:account_transaction][:amount].to_f
          #出金口座からは取引額を引き、入金口座には取引額を足して更新する
          @withdrawal_basic_income_account.update(balance: @withdrawal_basic_income_account.balance - @amount)
          @deposit_basic_income_account.update(balance: @deposit_basic_income_account.balance + @amount)
        end
      end
    end
    redirect_to root_path#トランザクション成功とみなし、root_path(ホーム画面）に戻る
  rescue => e
    render plain: e.message

  end

  private
  def account_transaction_params
  params.require(:account_transaction).permit(:deposit_account_id, :amount)
  end
end
