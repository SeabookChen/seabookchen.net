# Usage: rake jekyll [port=4001] [trace=true] [detach=true]
desc "Start Jekyll locally"
task :jekyll do
	port = ENV['port'] || '4000'
	trace = ENV['trace'] == 'true' ? '--trace' : ''
	detach = ENV['detach'] == 'true' ? '--detach' : ''
	system "jekyll serve --watch --drafts --port=#{port} #{trace} #{detach}"
end