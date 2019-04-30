namespace :csv do
  desc "Ingest data from CSV"
  task import_data: :environment do
    # model_directory = Dir.glob("#{Rails.root}/app/models/*.rb")
    # model_directory.each{ |model| require model}

    data_directory = "#{Rails.root}/db/data/"
    association = {
      "customers.csv" => Customer,
      "merchants.csv" => Merchant,
      "items.csv" => Item,
      "invoices.csv" => Invoice,
      "invoice_items.csv" => InvoiceItem,
      "transactions.csv" => Transaction
    }
    association.each do |path, model|
      puts path
      data = CSV.open(data_directory + path, headers: true, header_converters: :symbol)

      data.each do |row|
        hash = row.to_hash

        if hash[:unit_price] != nil
          price = hash[:unit_price].to_i / 100.0
          hash[:unit_price] = price
        end

        model.create!(hash)
      end
    end

    binding.pry
  end

end
