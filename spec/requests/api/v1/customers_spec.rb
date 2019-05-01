require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers.json'

    expect(response).to be_successful
    desired_attributes = ['id','first_name','last_name']
    items = JSON.parse(response.body)
    assert(items['data'].count).to eq(3)
    items['data'].each do |customer|
      desired_attributes.each do |attribute|
        assert(customer['attributes'].include?(attribute)).to eq(true)
    end
  end
end
