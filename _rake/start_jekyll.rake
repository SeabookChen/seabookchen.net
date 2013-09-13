# Usage: rake jekyll [port=4001] [trace=true]
desc "Start Jekyll locally"
task :jekyll do
	port = ENV['port'] || '4000'
	trace = ENV['trace'] == 'true' ? '--trace' : ''
	system "jekyll serve --watch --drafts --port=#{port} #{trace}"
end