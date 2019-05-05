class Api::V1::Merchants::ItemsController < Api::V1::Merchants::BaseController
  def initialize
    @relation = :items
    super
  end
end
