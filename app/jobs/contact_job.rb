class ContactJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ContactMailer.submission(message).deliver
  end
end
