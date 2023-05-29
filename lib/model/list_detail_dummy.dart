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

var trainingLevel = [
  {
    'name': 'Beginner',
    'value': 1,
    'desc': 'I want to start training',
    'onTap': 'false'
  },
  {
    'name': 'Intermediate',
    'value': 2,
    'desc': 'I train 3 - 5 times a week',
    'onTap': 'false'
  },
  {
    'name': 'Advanced',
    'value': 3,
    'desc': 'I train more than 5 times a week',
    'onTap': 'false'
  },
];

var memberPackage = [
  {
    'duration': '1 Month',
    'value': '1',
    'price': 'Rp 99.000',
    'desc': 'per month',
    'onTap': 'false'
  },
  {
    'duration': '3 Month',
    'value': '2',
    'price': 'Rp 199.000',
    'desc': 'per 3 months',
    'onTap': 'false'
  },
  {
    'duration': '1 Year',
    'value': '3',
    'price': 'Rp 699.000',
    'desc': 'per year',
    'onTap': 'false'
  }
];
