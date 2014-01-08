require 'minitest/autorun'
require 'minitest/spec'
require 'open3'

describe "Peeking using pry-rescue via SIGQUIT" do
  specify "should not result in failures" do
    Open3.popen2e("ruby main.rb") do |stdin, output, wait_thread|
      sleep 2
      Process.kill 'QUIT', wait_thread.pid
      script_output = ""
      loop do
        script_output << output.gets
        break if script_output =~ /Frame/
      end
      script_output.wont_match /Failed/
    end
  end
end