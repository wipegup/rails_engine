require 'rails_helper'

describe "Invoice Items API" do
  before :each do
    create_list(:invoice_item, 3)
    @desired_attributes = ['id','item_id','invoice_id','quantity','unit_price']
  end
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items.json'

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items['data'].count).to eq(3)
    items['data'].each do |invoice_item|
      @desired_attributes.each do |attribute|
        assert(invoice_item['attributes'].include?(attribute))
      end
    end
  end

  it "sends a single invoice_item" do
    id = InvoiceItem.last.id
    get "/api/v1/invoice_item/#{id}.json"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    @desired_attributes.each do |attribute|
      assert(item['data']['attributes'].include?(attribute))
    end
  end

end
