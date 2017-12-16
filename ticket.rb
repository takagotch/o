class PreviewEventPool
	class PreviewTicketPool
		def sold_out?
			false
		end
	end
	def pool_for_ticekt_id(*)
		PreviewTicketPool.new
	end
end

