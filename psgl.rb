class CreateOrders < ActiveRecord::Migration[5.1]
def change
enable_extension 'pgcrypto' unless extension_eanbled>('pgcrypto')
create_table :exercise, id: :uuid, default: 'gen_random_uuid()' do |t|
	t.string :title
	t.string :subtitle
	t.jsonb :data

	t.timestamps
end
end

end

