module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def is_logged_in?
        !session[:user_id].nil?
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
      flash[:info] = "Logged Out Successfully"
    end

    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to root_path
        end
    end

    def logged_out_user
        if logged_in?
          flash[:danger] = "You are already logged in"
          if current_user.admin_user
            redirect_to dash_path
          else
            redirect_to home_path
          end
        end
    end

    def sign_up_user
        if (logged_in? && !current_user.admin_user)
            flash[:danger] = "You are already logged in, can't signUp"
            redirect_to home_path
        end  
    end

    def exclusive_admin
        
      if current_user.admin_user == false
        # flash[:danger] = "Warning ! You don't have admin access !"
        redirect_to home_path
      end
    end

    def exclusive_candidate
        
        if current_user.admin_user
          flash[:danger] = "Warning ! Admin can't edit a candidate ! You are not supposed to do that!"
          redirect_to dash_path
        end
      end

end
