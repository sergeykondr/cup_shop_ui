import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cups_shop/constants.dart';
import 'package:cups_shop/models/Product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: buildBody(product, context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/search.svg')),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset('assets/icons/cart.svg')),
      ],
    );
  }

  buildBody(Product product, BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            //height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: (size.height -
                              AppBar().preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.45),
                  padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      description(product),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(),
                          favoriteButton(),
                        ],
                      ),
                      SizedBox(height: 20),
                      buyButtons(product)
                    ],
                  ),
                ),
                ProductTitileWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container favoriteButton() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      child: IconButton(
        iconSize: 20,
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Row buyButtons(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(right: kDefaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              border: Border.all(color: Colors.black45)),
          child: IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: product.color,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Text(
              'Buy now'.toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Padding description(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        countersButtons(
            icon: Icons.remove,
            press: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        countersButtons(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox countersButtons({IconData? icon, VoidCallback? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.black54,
        ),
        onPressed: press,
      ),
    );
  }
}

class ColorAndSize extends StatelessWidget {
  final Product product;

  const ColorAndSize({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Цвет'),
              Row(
                children: [
                  Row(
                    children: [
                      Point(color: Color(0xFFF8C078)),
                      Point(color: Color(0xFF356C95), isSelected: true),
                      Point(color: Color(0xFFA29B9B)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(style: TextStyle(color: kTextColor), children: [
              TextSpan(text: 'Размер\n'),
              TextSpan(
                  text: "${product.size} cm",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold))
            ]),
          ),
        )
      ],
    );
  }
}

class Point extends StatelessWidget {
  final Color color;
  final bool isSelected;

  Point({
    required this.color,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Color(0xFF356C95) : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class ProductTitileWithImage extends StatelessWidget {
  const ProductTitileWithImage({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Описание", style: TextStyle(color: Colors.white)),
              Text(
                product.title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Цена',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(product.price.toString() + " ₽",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(width: kDefaultPadding),
              Image.asset(
                product.image,
                width: width / 2,
                fit: BoxFit.fitWidth,
              )
            ],
          )
        ],
      ),
    );
  }
}
