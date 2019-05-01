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

  def to_sym(model)
    model.name.underscore.pluralize.to_sym
  end
end
