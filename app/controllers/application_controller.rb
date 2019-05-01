class ApplicationController < ActionController::API

  def serializers
    {invoices: InvoiceSerializer,
     Invoice => InvoiceSerializer,
     customers: CustomerSerializer,
     Customer => CustomerSerializer,
     invoice_items: InvoiceItemSerializer,
     InvoiceItem => InvoiceItemSerializer
     # merchant: MerchantSerializer,
     # item: ItemSerializer,
     # transaction: TransactionSerializer
   }
  end
end
