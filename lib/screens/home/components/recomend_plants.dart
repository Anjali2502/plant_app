import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/components/details_screen.dart';

import '../../../constrants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: 'assets/images/image_1.png',
            title: 'Samantha',
            country: 'Russia',
            price: 440,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
              );
            },
          ),
          RecomendPlantCard(
            image: 'assets/images/image_2.png',
            title: 'Angelica',
            country: 'Russia',
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: 'assets/images/image_3.png',
            title: 'Samantha',
            country: 'Russia',
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}


class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press}) : super(key: key);

  final String image, title, country;
  final int price;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // cover 40% of total width of the screen
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$title\n'.toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                            text: '$country'.toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            )
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text('\$$price', style: Theme.of(context).textTheme.button!.copyWith(color: kPrimaryColor),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
