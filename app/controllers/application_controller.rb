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

  def build_search_hash
    @search_terms.inject({}) do |hash,key|
      hash[key]=params[key]
      hash
     end.compact
  end

end
