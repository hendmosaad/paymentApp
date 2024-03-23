class PaymentInputModel{
  int amount;
  String currency;
  PaymentInputModel({required this.amount,required this.currency});
  toJson(){
    return {
      'amount':amount*100,
      'currency':currency,

    };
  }

}