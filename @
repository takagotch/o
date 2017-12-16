ActiveRecord::Base.descendants.sort_by(&:name).each do |klass|
	klass.reflections.select do |_name, refl|
		refl.macro == :has_and_belongs_to_many
	end.each do |name, refl|
		if Rails::VERSION::MAJOR == 3
			puts [
				klass.name,
				name,
				refl.optoins[:join_table]
			].inspect
		else
			puts [
				klass.name,
				name,
				refl.join_table
			].inspect
		end
	end
end

