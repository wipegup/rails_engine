class RenderController < ApplicationController
  def index
    @list ||= @model.all
    render json: serializer.new(@list)
  end

  def show
    @individual ||= params[:id] == 'random'? @model.random : @model.find(params[:id])
    render json: serializer.new(@individual)
  end
end
