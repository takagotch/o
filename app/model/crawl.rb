Class Crawl

def get_html(url)
	clinet = HTTPClient.new
	client.connect_timeout = 10
	client.send_timeout = 10
	client.receive_timeout = 30

	cache_id = Digest::SHA1.hexdigest(url)
	cache_path = "#{Rails.root}/tmp/cache/response/#{cache_id}"
	FileUtils.mkdir_p(File.dirname(cache_path), mode: 0771)

	# using cache
	if File.exist?(cahe_path) 
	  Rails.logger.debug "using cache: url=#{url}"
	  return File.read(cache_path, encoding: 'binary')	
	end

	response = client.get(url, :follow_redirect => true)
	unless response.status == 200
		raise "request failed: #{response.inspect}"
	end

	#nocache
	Rails.logger.dubug "no cache: url=#{url}"
		File.open(cache_path, 'w:binary'){|f|
			f.print response.body
	}

	response.body
        end
end

