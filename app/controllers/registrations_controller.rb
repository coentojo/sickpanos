class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    if(params["code"] == "iamsick") 
      puts "helloooo"
    else
      format.html { redirect_to new_registration_user_path, notice: 'User was successfully updated.' }
    end
  end

  def update
    super
  end
  
  def edit
    super
  end
  
  def destroy
    super
  end
  
end