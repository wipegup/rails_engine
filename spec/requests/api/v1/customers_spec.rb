require 'rails_helper'

describe "Customers API" do
  before :each do
    create_list(:customer, 3)
    @desired_attributes = ['id','first_name','last_name']
  end

  it "sends a list of customers" do

    get '/api/v1/customers.json'

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items['data'].count).to eq(3)
    items['data'].each do |customer|
      @desired_attributes.each do |attribute|
        assert(customer['attributes'].include?(attribute))
      end
    end
  end

  it "sends a single customer" do
    cust_id = Customer.last.id
    get "/api/v1/customers/#{cust_id}.json"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    @desired_attributes.each do |attribute|
      assert(item['data']['attributes'].include?(attribute))
    end
  end

end
