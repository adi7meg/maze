class GenerateRandomUserJob <ApplicationJob

  queue_as :default

  def perform(*args)
    # Do something
    # def import
    #   User.import(params[:file])
    #   flash[:notice] = "Users Uploaded Sucessfully"
    #   redirect_to root_path
    # end
    # def import_page
    #   @users = User.all
    # end
  end

end