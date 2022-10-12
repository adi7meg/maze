class CreateBulkUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # puts "Lets Refresh our create bulk users"
    # raise 'hell'

    # def import
    #   User.import(params[:file])
    #   flash[:notice] = "Users Uploaded Sucessfully"
    #   redirect_to users_path
    # end
  end
end

