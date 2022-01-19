import 'package:enum_to_string/enum_to_string.dart';

enum orderStatus { ORDERED, DELIVERED, RETURNED }

class Order {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final orderStatus? status;
  final String registered;
  Order(
      {required this.company,
      required this.id,
      required this.isActive,
      required this.picture,
      required this.price,
      required this.registered,
      required this.status,
      required this.buyer,
      required this.tags});

  Order.fromJson(Map<String, dynamic> json)
      : company = json['company'],
        id = json['id'],
        isActive = json['isActive'],
        picture = json['picture'],
        price = json['price'],
        registered = json['registered'],
        status = EnumToString.fromString(orderStatus.values, json['status']),
        tags = List<String>.from(json['tags']),
        buyer = json['buyer'];

  Map<String, dynamic> toJson() => {
        'company': company,
        'id': id,
        'isActive': isActive,
        'price': price,
        'picture': picture,
        'registered': registered,
        'status': EnumToString.convertToString(status),
        'tags': tags,
        'buyer': buyer
      };

  @override
  String toString() {
    // TODO: implement toString
    return registered;
  }
}
