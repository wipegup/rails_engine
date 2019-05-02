 class Api::V1::Customers::InvoicesController < RelationsController
   def initialize
     @relation = :invoices
   end
   def index
     @individual = Customer.find(params[:customer_id])
     super
   end
 end
