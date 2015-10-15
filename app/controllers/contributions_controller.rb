class ContributionsController < ApplicationController
  def new
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new
    @contribution.image = "Animals/#{1+rand(15).ceil}.png"
  end

  def create
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new(contribution_params)
    @contribution.image = params[:contribution][:image]
    if @contribution.save
      redirect_to story_path(@contribution.story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.find(params[:id])
  end

  def edit
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.find(params[:id])
  end

  def update
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.find(params[:id])
    if @contribution.update(contribution_params)
      redirect_to story_path(@story)
    else
      render :edit
    end
  end

  private
    def contribution_params
      params.require(:contribution).permit(:username, :sentence)
    end
end
