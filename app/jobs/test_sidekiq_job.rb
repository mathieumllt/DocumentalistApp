class TestSidekiqJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	puts "bonjour monde"
  end
end
