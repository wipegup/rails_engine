class FindController < ApplicationController
  def show
    search_hash = build_search_hash

    individual = @model.find_by(search_hash)
    render json: serializers[to_sym(@model)].new(individual)
  end

  def index
    search_hash = build_search_hash

    all_matching = @model.where(search_hash)
    render json: serializers[to_sym(@model)].new(all_matching)

  end
end
