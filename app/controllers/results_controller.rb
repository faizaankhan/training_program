class ResultsController < ApplicationController
  
  before_action :logged_in_user
  before_action :exclusive_admin, only: [:index, :create, :update, :view, :destroy]
  
  def index
    # retrieve the user
    puts params
    user = User.find(params[:user_id])
    # Get all the exams associated with the user
    @exams = user.exams
    @results = user.results
  end

  def show
  end

  def view
    puts "I reach here"
    @user = User.find(params[:user_id])
    @exam = Exam.find(params[:exam_id])
    @result = Result.where(exam_id: @exam.id).where(user_id: @user.id).take
  end

  def new
  end

  def edit
    
  end

  def update
    @result = Result.find(params[:id])
    if @result.update_attributes(result_params)
      flash[:notice] = "Updation Successful."
      UserMailer.send_result(@result).deliver_now
      flash[:info] = "Email sent to Candidate"

      redirect_to(user_results_path(@result.user_id))
    else
      render('edit')
    end
  end

  def delete 
  end
  
  def create 
    puts params[:exam_id]
      params[:a_candidate].each do |candidate_id|
        puts candidate_id
        @r = Result.where('exam_id=? AND user_id=?',params[:exam_id],candidate_id).first
        # puts @r.exam_id
        if @r
          puts "found"
        else
          @result = Result.new(user_id: candidate_id , exam_id: params[:exam_id])
          @result.save
          puts "Created new"
        end
      end
      redirect_to exams_path
  end

  private
  
    def result_params
      #Whitelisting for strng parameters
      params.require(:result).permit(:marks, :results, :comments, :attach)
    end
end
