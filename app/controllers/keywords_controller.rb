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
    @resources = current_model.resources
  end

  def update
    @keyword = Keyword.find(params[:id])
    if @keyword.updta_attributes(keyword_params)
      redirect_to keywords_path
    else
      render 'edit'
    end
  end

  def show
    @keyword = Keyword.find(params[:id])
  end

  def destroy
    @keyword = Keyword.find(params[:id])
    @keyword.destroy
    redirect_to keywords_path
  end

  private
    def keyword_params
      params.require(:keyword).permit(:keyword, :resource_id)
    end
end
