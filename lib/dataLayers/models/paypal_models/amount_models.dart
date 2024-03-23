class amountModel{
Amount amount ;
amountModel ({required this.amount});
factory amountModel.fromJson({required Map<String ,dynamic > json}){
  return amountModel(amount: Amount.fromJson(json: json['amount']));
}
}
class Amount{
 String total;
 String currency;
 Details details;
 Amount ({required this.currency,required this.details,required this.total});
 factory Amount.fromJson({required Map<String,dynamic >json}){
   return Amount(currency: json['currency'], details: Details.fromJson(json: json['details']), total: json['total']);
 }
}
class Details{
  String subtotal;
   String shipping;
   int shipping_discount;
 Details ({required this.shipping,required this.shipping_discount,required this.subtotal});
 factory Details.fromJson({required Map<String ,dynamic>json}){
  return Details(shipping: json['shipping'], shipping_discount: json['shipping_discount'], subtotal: json['subtotal']);
 }

}