import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/Order.dart';
import '../models/Graph.dart';

class OrderProvider with ChangeNotifier {
  List<Order> allOrders = [];

  Future<List<Order>> readOrdersJson() async {
    final String response = await rootBundle.loadString('assets/orders.json');
    final data = await json.decode(response);
    return (data as List).map((e) => Order.fromJson(e)).toList();
  }

  List<Order> get orders {
    return allOrders;
  }

  int getTotalOrders() {
    return allOrders.length;
  }

  String getAveragePrice() {
    if (allOrders.isNotEmpty) {
      double total = allOrders.fold(0,
          (previousValue, element) => previousValue + getPrice(element.price));
      return (total / allOrders.length).toStringAsFixed(0);
    }
    return "0";
  }

  List<Graph> getGraphData() {
    final sortedByDate = [...allOrders];

    sortedByDate.sort((a, b) {
      return a.registered.compareTo(b.registered);
    });

    final graphData =
        sortedByDate.map((e) => e.registered.split("T")[0]).toSet().toList();

    final graphList = graphData
        .asMap()
        .map((i, e) {
          final orderList = allOrders
              .where((element) => e == element.registered.split("T")[0])
              .toList();
          return MapEntry(i, Graph(count: orderList.length, year: e));
        })
        .values
        .toList();

    return graphList;
  }

  int getReturnedListNumber() {
    if (allOrders.isNotEmpty) {
      final returnedList =
          allOrders.where(((e) => e.status == orderStatus.RETURNED)).toList();
      return returnedList.length;
    }
    return 0;
  }

  double getPrice(String orderPrice) {
    return double.parse(
        orderPrice.replaceFirst("\$", "").replaceFirst(",", ""));
  }

  List<Order> getTopCompanies() {
    final topCompanies =
        allOrders.where((e) => e.status == orderStatus.DELIVERED).toList();
    topCompanies.sort((a, b) => b.price.compareTo((a.price)));
    return topCompanies;
  }

  convertOrders() async {
    allOrders = await readOrdersJson();
    notifyListeners();
  }

  OrderProvider() {
    convertOrders();
  }
}
