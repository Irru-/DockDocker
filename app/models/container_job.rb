class ContainerJob < ActiveRecord::Base
  def self.enqueue(*args)
    Resque::Job.create(args[0], self, args[1], args[2])
  end

  def self.perform(*args)
    #Do stuff
  end
end
