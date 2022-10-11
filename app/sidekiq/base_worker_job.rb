# class BaseWorkerJob
#   include Sidekiq::Job
#
#   # If I don’t want to perform the job again in case of failure.
#   sidekiq_options retry: false
#   def perform(*args)
#     # Do something
#   end
# end
