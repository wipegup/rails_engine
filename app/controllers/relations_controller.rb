class RelationsController < ApplicationController
  def index
    render json: serializers[@relation].new(@individual.send @relation)
  end
end
