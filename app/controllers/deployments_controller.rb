class DeploymentsController < ApplicationController
  def index
    @deployment_types = Deployment.all.group_by(&:type)
  end

  def show
    @current_deployment = Deployment.find(params[:id])
  end
end
