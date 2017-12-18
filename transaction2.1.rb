class AccountTransactionsController < ApplicationController

  def new
    @account_transaction = AccountTransaction.new
  end

  def create
    begin
      ActiveRecord::Base.transaction{
        @account_transaction = AccountTransaction.new(
          withdrawal_account_id: current_user.basic_income_account.id,
          deposit_account_id: BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id]).id,
          amount: params[:account_transaction][:amount]
          )
        @account_transaction.save!

        @account_transaction.deposits_and_withdrawals.build(
          transaction_type: "出金",
          basic_income_account_id: current_user.basic_income_account.id,
          amount: -1 * params[:account_transaction][:amount].to_f
        )
        @account_transaction.deposits_and_withdrawals.build(
          transaction_type: "入金",
          basic_income_account_id: BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id]).id,
          amount: params[:account_transaction][:amount].to_f
          )
        @account_transaction.save!


        @withdrawal_basic_income_account = current_user.basic_income_account
        @deposit_basic_income_account = BasicIncomeAccount.find_by(account_number: params[:account_transaction][:deposit_account_id])

        @amount = params[:account_transaction][:amount].to_f

        @withdrawal_basic_income_account.update!(balance: @withdrawal_basic_income_account.balance - @amount)
        @deposit_basic_income_account.update!(balance: @deposit_basic_income_account.balance + @amount)

      }
      #完全成功なら、root_path(ホーム画面へ)
      redirect_to root_path
    #以下は例外が発生（プロセスの内どこかが失敗）したときに行う。rescueは自分でカスタマイズした例外処理を行えるが、railsが自動的に表示してくれるエラーを見たければ一旦resucueをコメントアウトしてみよう。
    rescue e.message
    #flash[:notice] = "失敗しました。リトライしてみてください"
    #render "new"       　　
      #rollback
    end
  end
