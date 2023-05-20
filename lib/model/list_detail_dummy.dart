import 'package:flutter/material.dart';

List<Icon> icon = const [
  Icon(
    Icons.star,
    size: 14,
    color: Color(0xffFFE600),
  ),
  Icon(
    Icons.star,
    size: 14,
    color: Color(0xffFFE600),
  ),
  Icon(
    Icons.star,
    size: 14,
    color: Color(0xffFFE600),
  ),
  Icon(
    Icons.star,
    size: 14,
    color: Color(0xffFFE600),
  ),
  Icon(
    Icons.star,
    size: 14,
    color: Color(0xff7D7D7D),
  )
];
var package = [
  {'harga': 65000, 'type': '/ Daily', 'status': false},
  {'harga': 150000, 'type': '/ Weekly', 'status': false},
  {'harga': 1800000, 'type': '/ Monthly', 'status': false}
];

var paymentMethode = [
  {
    'type': 'GO-PAY',
    'value': 1,
    'desc': 'Scan QR code with GO-JEK app',
    'image': 'assets/images/gopay.png',
    'onTap': 'false',
  },
  {
    'type': 'Credit Card',
    'value': 2,
    'desc': 'Payment will be redirect to Midtrans',
    'image': 'assets/images/credit-card.png',
    'onTap': 'false',
  },
  {
    'type': 'ShopeePay',
    'value': 3,
    'desc': 'Payment will be redirect to Shopee App',
    'image': 'assets/images/ShopeePay.png',
    'onTap': 'false',
  },
];
