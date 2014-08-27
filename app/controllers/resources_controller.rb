class ResourcesController < ApplicationController
	before_action :authenticate_model!
	def index
		# @resources = Resource.paginate(page: params[:page])
		@resources = current_model.resources.paginate(page: params[:page])
	end
	def new
		@user = Model.find(current_model.id)
		@resource = Resource.new
	end
	def create
		res = Resource.new(resource_params)
		res.model = current_model
		if res.save
			redirect_to resources_path
		else
			render 'new'
		end
	end
	def edit
		@resource = Resource.find(params[:id])
	end
	def show
		@resource = Resource.find(params[:id])
	end
	def update
		@resource = Resource.find(params[:id])
		if @resource.update_attributes(resource_params)
			redirect_to resources_path
		else
			render 'edit'
		end

	end
	def destroy
		@resource = Resource.find(params[:id])
		@resource.destroy
		redirect_to resources_path
	end

	private
		def resource_params
			params.require(:resource).permit(:title, :content)
		end
end
