 class Api::V1::InvoiceItems::InvoicesController < Api::V1::InvoiceItems::BaseController
   def initialize
     @relation = :invoices
     super
   end
 end
