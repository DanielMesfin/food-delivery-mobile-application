import 'package:flutter/material.dart';
import 'package:food_delivery/constances/get_size.dart';
import 'package:food_delivery/constances/Styes.dart';
import 'package:gap/gap.dart';
import 'package:food_delivery/screens/detail_screen.dart';

class MenuCard extends StatelessWidget {
  final Map<String, dynamic> menuData;
  const MenuCard({super.key, required this.menuData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: GetSize.getScreenHeight(20),
      ),
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Styles.cardBgColor),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: GetSize.getScreenWidth(15),
              right: GetSize.getScreenWidth(8),
              top: GetSize.getScreenHeight(15),
              bottom: GetSize.getScreenHeight(15),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/${menuData['image']}'),
              radius: 45,
            ),
          ),
          Gap(
            GetSize.getScreenWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                menuData['name'],
                style: Styles.headerThreeTextStyle,
              ),
              Gap(GetSize.getScreenHeight(7)),
              Text(
                menuData['wight'],
                style: Styles.headerFourTextStyle,
              ),
              MaterialButton(
                color: Styles.buttonBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        detailInfo: menuData,
                      ),
                    ),
                  );
                },
                child: Text(
                  '\$ ${menuData['price'].toString()}',
                  style: Styles.buttonTextStyle,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
