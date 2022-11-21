import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body1(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
            color: kTextLightColor,
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              color: Colors.black,
            )),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
      leading: IconButton(
        onPressed: () {
          //Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          //color: kTextLightColor,
          // width: 15,
          // height: 20,
        ),
      ),
    );
  }
}
