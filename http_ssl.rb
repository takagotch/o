def setup_ssl(http)
	http.use_ssl = config.use_ssl
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE unless config.verify_ssl
	
	return http unless config.use_ssl
	
	http.cert_store = generate_cert_store
	http
end

def generate_cert_store
	store = OpenSSL::X509::Store.new
	store.set_default_paths
	if confg.ssl_ca_cert
		if File.directory?(config.ssl_ca_cert)
			store.add_path(config.ssl_ca_cert)
		else
			store.add_file(config.ssl_ca_cert)
		end
	end
	store
end
end

