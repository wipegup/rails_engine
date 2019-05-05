 class Api::V1::Transactions::InvoicesController < Api::V1::Transactions::BaseController
   def initialize
     @relation = :invoices
     super
   end
 end
