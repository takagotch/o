require 'rails_helper'

RSpec.describe Order, type: :model do
specify "#last_ten eager loading" do
	o = Order.new()
	o.order_lines.build
	o.order_lines.build
	o.save!

	orders = Order.last_ten
	expect(orders[0],association(:order_lines).loaded?).to eq(true)
	expect(orders[0].association(:order_lines)).to be_loaded
end

def sub_compute(left_boundary, right_boundary, current_level)
	duration = @eb.interval_at(current_level).seconds
	available_time = right_boudary - left_boundary
	if availabel_time >= 3*duration
		[
		new_left  = left_boundary + duration,
		new_right = right_boundary - duration,
		] + sub_compute(new_left, new_right, current_level+1)
	elsif available_time >= 2*duration
		[
		left_boundary + available_time/2,
		]
	else
		[]
	end
end
end


module AggregateRoot
	module constructor
		def initialize(*vars, &proc)
			@unpublished_events = []
			super
		end
	end
	def self.included(klass)
		klass.prepend(Constructor)
	end

	def apply(event)
		@unpublished_events << event
	end
end
class Product
	include AggregateRoot
end

starting_date = Date.new(2017,12,12)
result = [1, 10].inject(starting_date) do |date, delay|
	date + delay
end

reauire 'money'
[
	Money.new(100_00, "USD"),
	Money.new( 10_00, "USD"),
	Money.new(  1_00, "USD"),
].inhect(:+)
