class QuestionsController < ApplicationController
  
  before_action :logged_in_user
  before_action :exclusive_admin, only: [:create, :destroy,:index, :show, :edit, :delete, :update_question]

  def index
  end

  def show
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.create(question_params)
    redirect_to exam_path(@exam)
  end
  
  def edit
  
  end

  def update_question
    @exam = Exam.find(params[:id])
    @question = @exam.questions.find(params[:question_id])
    if @question.update_attributes(allowed_params)
      redirect_to exam_path(@exam)
    else
      flash[:danger] = "Couldn't Update"
    end
  end

  def delete
  end

  def destroy 
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:id])
    @question.destroy
    redirect_to exam_path(@exam)
  end

  private

    def question_params
      params.require(:question).permit(:question_description, :exam_id)
    end

    def allowed_params
      params.permit(:question_description)
    end
end
