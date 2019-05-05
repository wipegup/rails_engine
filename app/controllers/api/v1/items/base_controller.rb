class Api::V1::Items::BaseController < RelationsController
  def initialize
    @model = Item
  end

  def id
    params[:item_id]
  end

  def index
    @id = id
    super
  end

  def show
    @id = id
    super
  end
end
