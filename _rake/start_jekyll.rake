# Usage: rake jekyll [port=4001] [trace=true] [detach=true]
desc "Start Jekyll locally"
task :jekyll do
	port = ENV['port'] || '4000'
	trace = ENV['trace'] == 'true' ? '--trace' : ''
	detach = ENV['detach'] == 'true' ? '--detach' : ''

	# Set active code page to avoid encoding issues on Windows
	case ENV['os'].downcase
		when '', 'linux'
			os = 'linux'
		when 'win', 'windows'
			os = 'windows'
	end
	if os == 'windows'
		system 'chcp 65001'
	end

	system "jekyll serve --watch --drafts --port=#{port} #{trace} #{detach}"
end