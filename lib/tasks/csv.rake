namespace :csv do
  desc "Ingest data from CSV"
  task import_data: :environment do
    data_directory = "#{Rails.root}/db/data/"
    associations = {
      "customers.csv" => Customer,
      "merchants.csv" => Merchant,
      "items.csv" => Item,
      "invoices.csv" => Invoice,
      "invoice_items.csv" => InvoiceItem,
      "transactions.csv" => Transaction
    }
    associations.each do |path, model|
      puts path
      data = CSV.open(data_directory + path, headers: true, header_converters: :symbol)

      data.each do |row|
        hash = row.to_hash

        if hash[:unit_price] != nil
          hash[:unit_price] = hash[:unit_price].to_i / 100.0
        end

        model.create!(hash)
      end
    end
  end

end
