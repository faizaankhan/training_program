class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :delete, :destroy,  :home, :dash, :summary]
  before_action :exclusive_admin, only: [:index, :delete, :destroy, :dash, :summary]
  before_action :sign_up_user, only: [:create, :new]
  before_action :exclusive_candidate, only: [:edit, :update]

  def index
    @users = User.sorted
    @candidates = User.where(admin_user: false)
    render('index')
  end

  def show
    @candidate = User.find(params[:id])
  end

  def new
    @candidate = User.new
  end

  def create
    #Instantiate a new object using form parameters
    @candidate = User.new(user_params)
    # Save the object
    if @candidate.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "New Candidate Added Successfully"
      #Will check if user is admin in session and if he is not then do the below 
      #log_in @user
      if !is_logged_in?
        log_in @candidate
      end
      redirect_to(users_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @candidate = User.find(params[:id])
  end

  def update 
    #Find a new object using form parameters
    @candidate = User.find(params[:id])
    # Save the object
    if @candidate.update_attributes(user_params)
      # If save succeeds, redirect to the index action
      flash[:notice] = "Updation Successful."
      redirect_to(user_path(@candidate))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @candidate = User.find(params[:id])
  end

  def destroy
    @candidate = User.find(params[:id])
    @candidate.destroy
    redirect_to(users_path)
  end

  def home
    user = User.find_by_id(@current_user.id)
    @exams = user.exams
    @results = user.results
  end

  def dash
  end

  def summary
    @users = User.sorted
    @candidates = User.where(admin_user: false)
    @exams = Exam.sorted
  end

  private
  
    def user_params
      #Whitelisting for strng parameters
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :qualification, :college, :stream, :phone)
    end

end
