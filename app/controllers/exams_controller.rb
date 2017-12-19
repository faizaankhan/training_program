class ExamsController < ApplicationController
  def index
    @exams = Exam.sorted
    render('index')
  end

  def show
  end

  def new
    @exam= Exam.new
  end

  def create
    @exam = Exam.new(allowed_params)

    if @exam.save
      flash[:notice] = 'Successfully created exam'
      redirect_to exams_path
    else
      render :new
    end
  end

  def edit
  end

  def delete
  end

  def associate
    @candidates = User.where(admin_user: false)
    @exam_id = params[:id]
    @exam_name = params[:exam_name]
  end

  private
  
    def allowed_params
      params.require(:exam).permit(:exam_name)
    end
end