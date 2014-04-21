desc "Start Jekyll locally"
task :jekyll do
	puts 'Usage: rake jekyll [port=4000] [trace=true]'

	if ENV['help'].nil?
		port = ENV['port'] || '4000'
		trace = ENV['trace'] == 'true' ? '--trace' : ''

		# Set active code page to avoid encoding issues on Windows
		platforms = %w[mswin mingw32]
		if platforms.any? { |platform| RUBY_PLATFORM.downcase.include? platform }
			system 'chcp 65001'
		end

		system "jekyll serve --watch --drafts --port=#{port} --detach #{trace}"
		sleep 3

		system "compass compile ./assets/css"
		system "compass watch ./assets/css"
	end
end