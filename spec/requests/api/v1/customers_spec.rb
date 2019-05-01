require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers.json'

    expect(response).to be_successful

    items = JSON.parse(response.body)
    
  end
end
