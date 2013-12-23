desc "Start Jekyll locally"
task :jekyll do
	puts 'Usage: rake jekyll [port=4000] [trace=true] [detach=true]'

	if ENV['help'].nil?
		port = ENV['port'] || '4000'
		trace = ENV['trace'] == 'true' ? '--trace' : ''
		detach = ENV['detach'] == 'true' ? '--detach' : ''

		# Set active code page to avoid encoding issues on Windows
		if RUBY_PLATFORM.downcase.include? 'mswin'
			system 'chcp 65001'
		end

		system "jekyll serve --watch --drafts --port=#{port} #{trace} #{detach}"
	end
end