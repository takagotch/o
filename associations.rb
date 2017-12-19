CatalogCategory < ActiveRecord::Base
has_and_belongs_to_many :catalog_products,
	join_table: 'catalog_categories_catalog_products'
end

CatalogProduct < ActiveRecord::Base
has_and_belongs_to_many :catalog_categories,
	join_table: 'catalog_categories_products'
end

class Bundle < Discount
	has_and_belongs_to_many :products
end

class Bundle < Discount
has_and_belongs_to_many :products,
	join_table: "bundles_products"
end

