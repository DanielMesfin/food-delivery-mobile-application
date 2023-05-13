import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'home_page.dart';
import 'package:food_delivery/ReusableComponents/resueable_icon.dart';
import 'package:food_delivery/constances/Styes.dart';
import 'package:food_delivery/constances/get_size.dart';
import 'package:barcode_widget/barcode_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.appBgColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: GetSize.getScreenHeight(20),
            horizontal: GetSize.getScreenWidth(20),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Here is Payment Option',
                  style: Styles.headerThreeTextStyle,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  },
                  child: Stack(
                    children: const [
                      ReusableIcon(iconData: Icons.shopping_bag_outlined),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Gap(GetSize.getScreenHeight(15),),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidth(15),
                vertical: GetSize.getScreenHeight(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: GetSize.getScreenWidth(125),
                          child: const Image(
                            image: AssetImage('images/a.PNG'),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: GetSize.getScreenWidth(125),
                          child: const Image(
                            image: AssetImage('images/b.PNG'),
                          ),
                        ),
                      ]),
                  Gap(GetSize.getScreenHeight(20),),
                  Row(children: [
                    Container(
                      width: GetSize.getScreenWidth(125),
                      child: const Image(
                        image: AssetImage('images/c.PNG'),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: GetSize.getScreenWidth(125),
                      child: const Image(
                        image: AssetImage('images/d.PNG'),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Gap(
              GetSize.getScreenHeight(15),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidth(15),
                vertical: GetSize.getScreenHeight(15),
              ),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(
                    GetSize.getScreenHeight(13),
                  ),
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.purpleAccent,
                      width: 2)),
              child: BarcodeWidget(
                barcode: Barcode.code128(), // Barcode type and settings
                data: 'https://pub.dev/packages/barcode_widget', // Content
                width: double.infinity,
                height: 100,
                errorBuilder: (context, error) => Center(child: Text(error)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
