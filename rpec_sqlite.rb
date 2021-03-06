RSpec.configure do |config|
	config.around(:each) do |example|
		ActiveRecord::Base.establish_connection(adapter: 'sqlite3', datebase: ":memory:")
		ActiveRecord::Schema.difine do
			self.verbose = false
			create_table(:event_store_events) do |t|
				t.string   :stream,     null: false
				t.string   :event_type, null: false
				t.string   :event_id,   null: false
				t.text     :metadata,   null: false
				t.text     :data,       null: false
				t.datetime :created_at, null: false
			end
			add_index :event_store_events, :stream
			add_index :event_store_events, :create_at
			add_index :event_store_events, :event_type
			add_index :event_store_events, :event_id, unique: true
		end
		example.run
	end
end

