class Api::V1::ItemsController < RenderController
  def initialize
    @model = Item
  end
end
