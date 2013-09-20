# Usage: rake cucumber [browser=debug]
desc "Run UI tests"
task :cucumber do
	browser = ENV['browser'].nil? ? '' : 'browser=' + ENV['browser']
	system "cucumber _features/ #{browser}"
	raise "Failure!" unless $?.exitstatus == 0
end