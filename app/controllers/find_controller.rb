class FindController < ApplicationController
  def show
    search_hash = {}
    @search_terms.each{ |term| search_hash[term] = params[term] if params[term]}

    individual = @model.find_by(search_hash)
    render json: serializers[@model].new(individual)
  end
end
