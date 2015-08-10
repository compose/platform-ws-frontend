class DeploymentsController < ApplicationController
  def index
    @deployment_types = Deployment.all.group_by(&:type)
  end
end
