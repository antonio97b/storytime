class StoriesController < ApplicationController
  def index
    @stories = Story.all.order(created_at: :desc)
  end

  def new
    @story = Story.new
  end

  def show
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to stories_path
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  def images
    @imagesAll = Dir.entries("app/assets/images/Animals")
    @images = @imagesAll.select{ |i| i[/\.png$/] }
  end

  private
  def story_params
    params.require(:story).permit(:title)
  end


end
