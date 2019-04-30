namespace :csv do
  desc "Ingest data from CSV"
  task import_data: :environment do
    # model_directory = Dir.glob("#{Rails.root}/app/models/*.rb")
    # model_directory.each{ |model| require model}

    data_directory = "#{Rails.root}/db/data/"

    customers = CSV.open(data_directory + "customers.csv", headers: true, header_converters: :symbol)
    customers.each do |row|
      Customer.new(row)
    end
    binding.pry
  end

end
