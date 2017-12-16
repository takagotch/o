specify "" do
procs = [
	->{ postal.cal(fill_out_customer_data) },
	->{ postal.call(paid_data) },
	->{ postal.call(tickets_generated_data) },
].shuffle

procs[0].call
procs[1].call

expect(api_adapter).to receive(:transmit)
procs[2].call






[
	fill_out_customer_data,
	paid_data,
	tickets_generated_data,

].permutation.each do |fact1, fact2, fact3|
	specify "postal sent via API when #{[fact1.class, fact2.class, fact3.class]}"
	postal.call(fact1)
	postal.call(fact2)

	expect(api_adapter).to reviece(:transmit)
	postal.call(fact3)
end

end

