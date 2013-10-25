desc "Run UI tests"
task :cucumber do
	puts 'Usage: rake cucumber [browser=debug]'
	if ENV['help'].nil?
		browser = ENV['browser'].nil? ? '' : 'browser=' + ENV['browser']
		system "cucumber _features/ #{browser}"
		raise "Failure!" unless $?.exitstatus == 0
	end
end