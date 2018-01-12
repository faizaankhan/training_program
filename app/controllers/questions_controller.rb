class QuestionsController < ApplicationController
  
  before_action :logged_in_user
  before_action :exclusive_admin, only: [:create, :destroy,:index, :show, :edit, :delete]

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
end
