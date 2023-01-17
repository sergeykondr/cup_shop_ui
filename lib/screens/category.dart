import 'package:intl/intl.dart';

import '../models/Product.dart';
import '../screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Body1 extends StatelessWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Для кухни',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     //verticalDirection: ,
          //     children: childrenItem,
          //   ),
          // ),
          Categories(), //!!!!!!!!!!!!!!!!!!!!!!!!
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.70),
              itemBuilder: (context, index) => ItemCard(
                products[index],
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(products[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final void Function() press;

  const ItemCard(
    this.product,
    this.press, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat("#,### ₽", "en_US");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          
                          product.image,
                          fit: BoxFit.fitWidth,
                          //scale: ,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                  child: Text(
                    product.title,
                    style: TextStyle(color: kTextColor, fontSize: 18),
                  ),
                ),
                Text(
                  numberFormat.format(product.price),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'Чашки',
    'Чайники',
    'Кувшины',
    'Подставки',
    'Кофейники',
    'Скатерти'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? kTextColor
                            : kTextLightColor),
                  ),
                  Container(
                    height: 2,
                    width: 45,
                    color: selectedIndex == index
                        ? Colors.black
                        : Colors.transparent,
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      ),
    );
  }
}
