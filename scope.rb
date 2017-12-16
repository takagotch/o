def scoping
	previous, klass.current_scope = klass.current_scope, self
	yeild
ensure
	klass.current_scope = previous
end

