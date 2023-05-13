import 'package:flutter/material.dart';
import 'package:food_delivery/constances/get_size.dart';
import 'package:gap/gap.dart';
import 'package:food_delivery/constances/Styes.dart';
import 'package:food_delivery/ReusableComponents/menu_card.dart';
import 'package:food_delivery/ReusableComponents/resueable_icon.dart';
import 'package:food_delivery/models/menu_data.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/models/ordered_item.dart';
import 'check_out_screen.dart';
import 'presonalInformation.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle textStyleAnimated = Styles.boldTextStyle;
  List<Map<String, dynamic>> itemInBag = [];
  @override
  Widget build(BuildContext context) {
    int itemCountNumber = Provider.of<OrderedItemData>(context).getCount();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.appBgColor,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenWidth(15),
                  vertical: GetSize.getScreenHeight(15)),
              child: Column(
                children: [
                  Gap(GetSize.getScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PersonalInformation(),
                            ),
                          );
                        },
                        child: const ReusableIcon(
                          iconData: Icons.account_circle_outlined,
                        ),
                      ),
                      Stack(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(
                              GetSize.getScreenHeight(15),
                            ),
                            onTap: () {
                              if (itemCountNumber > 0) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CheckOutScreen(
                                      checkOutItem:
                                          Provider.of<OrderedItemData>(context)
                                              .itemInBag,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const ReusableIcon(
                              iconData: Icons.shopping_bag_outlined,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: CircleAvatar(
                              radius: 8.0,
                              backgroundColor: itemCountNumber > 0
                                  ? Colors.red
                                  : Colors.black12,
                              foregroundColor: Colors.white,
                              child: itemCountNumber > 0
                                  ? Text(
                                      itemCountNumber.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    )
                                  : const Text(''),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Gap(
                    GetSize.getScreenHeight(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Take away from',
                            style: Styles.headerFourTextStyle,
                          ),
                          Gap(
                            GetSize.getScreenHeight(12),
                          ),
                          Text(
                            '71 Tottenham Court Rd',
                            style: Styles.headerThreeTextStyle
                                .copyWith(fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      const ReusableIcon(
                        iconData: Icons.mode_edit_outline_outlined,
                      )
                    ],
                  ),
                  Gap(
                    GetSize.getScreenHeight(25),
                  ),
                  // TODO the way of having to help the ??
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 30.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        // TODO the state of each text...
                        InkWell(
                          onTap: () {
                            setState(() {
                              textStyleAnimated = const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Styles.buttonBgColor,
                                  decorationThickness: 7);
                            });
                          },
                          child: Text(
                            'New',
                            style: textStyleAnimated,
                          ),
                        ),
                        Gap(
                          GetSize.getScreenWidth(30),
                        ),
                        const Text('Burgers', style: Styles.boldTextStyle),
                        Gap(
                          GetSize.getScreenWidth(30),
                        ),
                        const Text('Pizza', style: Styles.boldTextStyle),
                        Gap(
                          GetSize.getScreenWidth(30),
                        ),
                        const Text('Drink', style: Styles.boldTextStyle),
                        Gap(
                          GetSize.getScreenWidth(30),
                        ),
                        const Text('Sushi', style: Styles.boldTextStyle),
                        Gap(
                          GetSize.getScreenWidth(30),
                        ),
                        const Text('Sweet', style: Styles.boldTextStyle),
                      ],
                    ),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                  Column(
                    children: menuList
                        .map((foodinfo) => MenuCard(menuData: foodinfo))
                        .toList(),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
