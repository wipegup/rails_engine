class ApplicationController < ActionController::API
  def serializer
    return serializers[@relation] if @relation
    serializers[to_sym(@model)]
  end

  def serializers
    {invoices: InvoiceSerializer,
     customers: CustomerSerializer,
     invoice_items: InvoiceItemSerializer,
     transactions: TransactionSerializer,
     items: ItemSerializer,
     merchants: MerchantSerializer
   }
  end

  def models
    {
     invoices: Invoice,
     customers: Customer,
     invoice_items: InvoiceItem,
     transactions: Transaction,
     items: Item,
     merchants: Merchant
   }
 end

  def to_sym(model)
    model.name.underscore.pluralize.to_sym
  end

  def search_hash
    @search_terms.inject({}) do |hash,key|
      hash[key]=params[key].gsub("-"," ") if params[key]
      hash
     end
  end

end
