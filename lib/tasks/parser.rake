desc "Parsing CSV Data"
task :parse => :environment do
  require 'csv'
  puts "Pulling in the CSV Data"

  def create_models(model, file)
    CSV.foreach("./lib/assets/#{file}", headers: true,
                           header_converters: :symbol,
                           converters: :numeric) do |row|
    model.create(row.to_h)
    puts "Created #{row}"
    end
  end

  file = {Customer => "customers.csv", Merchant => "merchants.csv", Item => "items.csv", Invoice => "invoices.csv", Transaction => "transactions.csv", InvoiceItem => "invoice_items.csv"}

  file.each do |model, file|
    create_models(model, file)
  end
end