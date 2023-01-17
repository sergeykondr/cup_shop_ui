import 'package:flutter/material.dart';

class Product {
  String image, title, description;
  int price, size, id;
  Color color;

  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.color});
}

List<Product> products = [
  Product(
      id: 1,
      title: "Coppa",
      price: 1200,
      size: 12,
      description: dummyText,
      image: "assets/images/3.png",
      color: Color(0xFFDFE879)),
  Product(
      id: 2,
      title: "Coppa Miso",
      price: 1380,
      size: 11,
      description: dummyText,
      image: "assets/images/6.png",
      color: Color(0xFFBFB9A9)),
  Product(
      id: 3,
      title: "Ligne Noire",
      price: 1350,
      size: 10,
      description: dummyText,
      image: "assets/images/10.png",
      color: Color(0xFFD2D9DB)),
  Product(
      id: 4,
      title: "Coppa",
      price: 1200,
      size: 12,
      description: dummyText,
      image: "assets/images/4.png",
      color: Color(0xFF82C0CE)),
  Product(
      id: 5,
      title: "Saisons",
      price: 1680,
      size: 12,
      description: dummyText,
      image: "assets/images/7.png",
      color: Color(0xFFBFC3C4)),
  Product(
    id: 6,
    title: "Coppa Curo",
    price: 1590,
    size: 11,
    description: dummyText,
    image: "assets/images/8.png",
    color: Color(0xFF6F6F6F),
  ),
];

String dummyText =
    "Почти каждая деталь — это ручная работа в единственном экземпляре. Четкий дизайн, уникальный в своем исполнении - с характером и индивидуальностью.";
