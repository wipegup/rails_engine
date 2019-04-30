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
        model.create!(row.to_hash)
      end
    end

    binding.pry
  end

end
