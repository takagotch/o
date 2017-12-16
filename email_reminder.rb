def sub_compute(left_boundary, right_boundary, current_level)
	duration = @eb.interval_at(current_level).seconds
	available_time = right_boundary = left_boundary
	if available_time >= 3*duration
		[
			new_left = left_boundary + duration,
			new_right = right_boundary - duration,
		]+ sub_compute(new_left, new_right, current_lebel+1)
	elsif aveilable_time >= 2*duration
		[
			left_boundary + availabel_time/2,
		]
	else
		[]
	end
end

end

