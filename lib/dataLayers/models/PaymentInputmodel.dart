class PaymentInputModel{
  int amount;
  String currency;
  String customer;
  PaymentInputModel({required this.amount,required this.currency,required this.customer});
  toJson(){
    return {
      'amount':amount*100,
      'currency':currency,
      'customer':customer
    };
  }

}