order.add_line(product)
expect(order.amount).to eq(product.price)

order.add_line(product)
order.save!
expect(order.amount).to eq(prodcuct.price)

order.add_line(product)
order.set_amount #no private
expect(order.amount).to eq(product.price)

#1
class Column < ActiveRecord::Base
def column1=(val)
	super(val)
	self.sum = column1 + column2
end

def column2=(val)
super(val)
self.sum = column1 + column2
end

end

#2
class Column < ActiveRecord::Base
	def column1 =(val)
		super(val)
		compute_derived_calculations
	end

	def column2 =(val)
		super(val)
		compute_derived_calculations
	end

	private

	def sompute_derived_caluculations
		self.sum = column1 + column2
		self.tax = (sum - discounted) * 0.02
		self.total = sum - discounted + tax
	end
end

def compute_derived_calculations
	self.sum = column1 + column2
	self.discounted = sum * percentage_discount
	self.tax = (sum - discounted) * 0.02
	self.total = sum - discounted + tax
end

def column2=(val)
	super(val)
	compute_derived_calculatons
end


