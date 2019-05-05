class FindController < RenderController

  def show
    @individual = @model.find_by(search_hash)
    super
  end

  def index
    @list = @model.where(search_hash)
    super
  end
end
