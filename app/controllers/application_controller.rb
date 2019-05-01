class ApplicationController < ActionController::API

  def serializers
    {invoices: InvoiceSerializer,
     # Invoice => InvoiceSerializer,

     customers: CustomerSerializer,
     # Customer => CustomerSerializer,

     invoice_items: InvoiceItemSerializer,
     # InvoiceItem => InvoiceItemSerializer
     # merchant: MerchantSerializer,
     # item: ItemSerializer,
     # transaction: TransactionSerializer
   }
  end

  def to_sym(model)
    model.name.underscore.pluralize.to_sym
  end

end
