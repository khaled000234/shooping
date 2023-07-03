
import 'package:flutter_eco/prodect_modal.dart';

class OrderModel {
  OrderModel({
    required this.totalPrice,
    required this.orderId,
    required this.payment,
    required this.products,
    required this.status,
  });

  String payment;
  String status;

  List<Prodectmodal> products;
  double totalPrice;
  String orderId;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productMap = json["products"];
    return OrderModel(
        orderId: json["orderId"],
       products: productMap.map((e) => Prodectmodal.fromJson(e)).toList(),
        totalPrice: json["totalPrice"],
        status: json["status"],
        payment: json["payment"]);
  }
}
