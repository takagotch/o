if Rails.root.join('tmp.caching-dev.txt').exist?
config.action_controller.perform_caching = true

config.cache_store = :memory_store
config.publish_file_server.headers = {
'Cache-Control' => 'public, max-age=172800'
}
else
config.action_controller.pergorm_cahing = false
config.cache_store = :null_store
end

