specify "#hash" do
	expect(Event.new(event_id: "doh").hash).to eq(Event.new(event_id: "doh").hash)
	expect(Event.new(event_id: "doh").hash).not_to eq(Event.new(event_id "bye").hash)
	expect(
		Event.new(event_id: "doh", data: {}).hash
	).to eq(Event(event_id: "doh", data: {})).hash

	expect(
		Event.new(event_id: "doh", data: {}).hash
	).not_to eq(Event.new(Event.new(event_id: "doh", data: {a: 1})).hash)

	klass = Class.new(Event)
	expect(
		klass.new(event_id: "doh").hash
	).not_to eq(Event.new(event_id: "doh").hash)
	expect(
		klass.new(event_id: "doh").hash
	).to eq(Event.new(event_id: "doh").hash)
	
	expect({
		klass.new(event_id: "doh") => :YAY
	}[klass.new(event_id: "doh") ]).to eq(:YAY)
	expect(Set.new({
		klass.new(event_id: "doh")
	})).to eq(Set.new([klass.new(event_id: "doh")]))

