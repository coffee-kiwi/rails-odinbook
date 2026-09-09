class Users::RegistrationsController < Devise::RegistrationsController

    def update
        if current_user.email == "guest@example.com"
            return redirect_to current_user, alert: "Sorry, the Guest account cannot be updated"
        end
        
        super
    end

end
