class RelationsController < ApplicationController
  def show
    relation = params[:relation].to_sym
    individual = @model.find(params[:id])
    render json: serializers[relation].new(individual.send relation)
  end
end
