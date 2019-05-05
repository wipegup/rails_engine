class RelationsController < RenderController
  def individual
    @model.find(@id)
  end

  def index
    # one query
    @list = models[@relation].where(to_sym(@model).to_s.singularize => @id)

    # two queries
    # @list = individual.send @relation
    super
  end

  def show
    # Two queries
    singular_relation = @relation.to_s.singularize
    @individual = individual.send singular_relation
    super
  end
end
