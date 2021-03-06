ActiveRecord::Schema.define(version: 201712182032) do

	create_table "account_transactions", force: :cascade do |t|
		t.decimal "account"
		t.datetime "creted_at", null: false
		t.datetime "updated_at", null: false
		t.integer "withdrawal_account_id"
		t.integer "deposit_account_id"
		t.index ["deposti_account_id"], name: "index_account_transactions_on_deposit_account_id"
		t.index ["withdrawal_accont_id"], name: "index_account_transactions_on_withdrawal_account_id"
	end

	create_table "basic_income_accounts", force: :cascade do |t|
		t.integer "user_id"
		t.string "account_number"
		t.decimal "balance"
		t.datetime "created_at", null: false
		t.datetime "updated_at", null: false
		t.index ["user_id"], name: "index_basic_income_accounts_on_user_id"
	end

	create_table "deposits_and_withdrawals", force: :cascede do |t|
		t.integer "account_transaction_id"
		t.string "transaction_type"
		t.decimal "account"
		t.datetime "created_at", null: false
		t.datetime "updated_at", null: false
		t.integer "basic_income_account_id"
		t.index ["account_transaction_id"], name: "index_deposits_and_withdrawals_on_account_transaction_id"
		t.index ["basic_income_account_id"], name: "index_deposits_and_withdrawals_on_basic_income_acocunt_id"
	end

