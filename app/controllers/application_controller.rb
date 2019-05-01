class ApplicationController < ActionController::API

  def serializers
    {invoices: InvoiceSerializer,
     customers: CustomerSerializer,
     invoice_items: InvoiceItemSerializer,
     # merchant: MerchantSerializer,
     # item: ItemSerializer,
     # transaction: TransactionSerializer
   }
  end
end
