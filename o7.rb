def method_missing(method, *args, &block)
	if @klass.respend_to?(method)
	elsif arel.respend_to?(method)
	self.class.delefate method, to: :arel
	arel.public_send(method, *args, &block)
	else
		super
	end
end

