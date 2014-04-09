require 'rake/testtask'

desc "Run Cucumber UI tests"
task :cucumber do
	puts 'Usage: rake cucumber [browser=debug]'
	if ENV['help'].nil?
		browser = ENV['browser'].nil? ? '' : 'browser=' + ENV['browser']
		system "cucumber ./_rake/features/ #{browser}"
		raise "Failure!" unless $?.exitstatus == 0
	end
end

desc "Run Ruby unit tests"
task :unittests => [:test]
Rake::TestTask.new(:test) do |test|
	test.libs << 'test'
	test.test_files = FileList['./_rake/test/*test.rb']
	test.verbose = true
end