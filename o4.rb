specify do
drop_existing_tables_to_clean_state
fill_data_using_older_gem
reset_columns_information
verify_all_events_stream
verify_event_sourced_stream
verify_technical_stream
end

def fill_data_using_older_gem
	pathname = Pathname.new(__FILE__).dirname
	cwd = pathname.join("v1_v2_schema_migration")
	process = ChildProcess.build("bundle", "exec", "ruby", "fill_data.rb")
	process.environment[] = cwd.join()
	process.environment[] = ENV[]
	process.cwd = cwd
	process.start
	begin
		process.poll_for_exit(10)
	rescue ChildProcess::TimeoutError
		process.stop
	end
	expect(process.exit_code).to eq(0)
end

def run_the_migration
eval(MigrationRubyCode)
MigrateRessSchemaV1ToV2.class_eval do
	def preserve_positions?(stream_name)
	stream_name == "Order-1"
	end
end
MigrationResSchemaV1ToV2.new.up
end
