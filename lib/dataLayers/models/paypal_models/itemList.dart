class ItemList {
  List<Items>? items;
  ShippingAddress? shippingAddress;

  ItemList({this.items, this.shippingAddress});

  ItemList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}

class Items {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Items({this.name, this.quantity, this.price, this.currency});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}

class ShippingAddress {
  String? recipientName;
  String? line1;
  String? line2;
  String? city;
  String? countryCode;
  String? postalCode;
  String? phone;
  String? state;

  ShippingAddress(
      {this.recipientName,
        this.line1,
        this.line2,
        this.city,
        this.countryCode,
        this.postalCode,
        this.phone,
        this.state});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    recipientName = json['recipient_name'];
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    countryCode = json['country_code'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipient_name'] = this.recipientName;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['city'] = this.city;
    data['country_code'] = this.countryCode;
    data['postal_code'] = this.postalCode;
    data['phone'] = this.phone;
    data['state'] = this.state;
    return data;
  }
}
