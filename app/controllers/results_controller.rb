class ResultsController < ApplicationController
  def index
    #retrieve the user
    puts params
    user = User.find(params[:user_id])
    #Get all the exams associated with the user
    @exams = user.exams
    @results = user.results
  end

  def show
  end

  def new
  end

  def edit
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
end
