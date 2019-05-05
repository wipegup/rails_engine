 class Api::V1::Customers::InvoicesController < Api::V1::Customers::BaseController
   def initialize
     @relation = :invoices
     super
   end
 end
