class KeywordsController < ApplicationController
  before_action :authenticate_model!
  def index
    @keywords = current_model.keywords.paginate(page: params[:page])
  end

  def new
    @keyword = Keyword.new
    @resources = current_model.resources
  end

  def create
    keyword = Keyword.new(keyword_params)
    keyword.model = current_model
    if keyword.save
      redirect_to keywords_path
    else
      render 'new'
    end
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end

  def update
    @keyword = Keyword.find(params[:id])
  end

  def show
  end

  def destroy
  end

  private
    def keyword_params
      params.require(:keyword).permit(:keyword, :resource_id)
    end
end
