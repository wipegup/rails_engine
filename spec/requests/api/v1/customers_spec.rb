require 'rails_helper'

describe "Customers API" do
  before :each do
    customers = create_list(:customer, 3)
    @desired_attributes = ['id','first_name','last_name']

    customers.each do |customer|
      create_list(:invoice, 3, customer:customer)
    end
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
    customer = Customer.last
    get "/api/v1/customers/#{customer.id}.json"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    @desired_attributes.each do |attribute|
      expect(item['data']['attributes'][attribute]).to eq(customer[attribute])
    end
  end

  it "returns a random customer" do
    get "/api/v1/customers/random.json"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    @desired_attributes.each do |attribute|
      assert(item['data']['attributes'].include?(attribute))
    end
  end

  it 'returns all customer invoices' do
    customer = Customer.last
    get "/api/v1/customers/#{customer.id}/invoices.json"

    invoice_attributes = ['id','merchant_id','customer_id']
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items['data'].count).to eq(3)
    # binding.pry
    invoice_attributes.each do |attribute|
      assert(items['data'][0]['attributes'].include?(attribute))
    end
  end

  it 'finds customer by id' do
    customer = Customer.last
    get "/api/v1/customers/find?id=#{customer.id}"
    expect(response).to be_successful
    item = JSON.parse(response.body)
    @desired_attributes.each do |attribute|
      expect(item['data']['attributes'][attribute]).to eq(customer[attribute])
    end
  end
end
