class LinksController < ApplicationController
  def index
    if params[:tag]
      @links = Link.tagged_with(params[:tag])
    else
      @links = Link.all
    end
		@links = @links.order("created_at DESC")
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to :links
    else
      render :new
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :tag_list)
  end
end
