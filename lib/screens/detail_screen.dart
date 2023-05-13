import 'package:flutter/material.dart';
import 'package:food_delivery/ReusableComponents/resueable_icon.dart';
import 'package:food_delivery/constances/Styes.dart';
import 'package:food_delivery/constances/get_size.dart';
import 'package:gap/gap.dart';
import 'order_screen.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> detailInfo;
  const DetailScreen({Key? key, required this.detailInfo}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Styles.appBgColor,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: GetSize.getScreenHeight(15),
                  horizontal: GetSize.getScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const ReusableIcon(
                                iconData: Icons.close_rounded))
                      ],
                    ),
                    Gap(GetSize.getScreenHeight(20)),
                    Container(
                      width: double.infinity,
                      height: GetSize.getScreenHeight(
                        GetSize.getScreenHeight(195),
                      ),
                      decoration: BoxDecoration(
                        color: Styles.cardBgColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'images/${widget.detailInfo['image']}'),
                        ),
                      ),
                    ),
                    Gap(
                      GetSize.getScreenHeight(10),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                        vertical: GetSize.getScreenWidth(2),
                        horizontal: GetSize.getScreenHeight(
                          GetSize.getScreenWidth(3),
                        ),
                      ),
                      color: Styles.buttonBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      onPressed: () {
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) =>  DetailScreen(detailInfo: menuData,),
                        //     ),
                        //   );
                      },
                      child: const Text(
                        'New',
                        style: Styles.buttonTextStyle,
                      ),
                    ),
                    Gap(
                      GetSize.getScreenHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.local_offer_outlined,
                          color: Colors.white,
                        ),
                        Gap(
                          GetSize.getScreenWidth(5),
                        ),
                        Text(
                          '\$ ${widget.detailInfo['price'].toString()}',
                          style: Styles.headerThreeTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Gap(
                          GetSize.getScreenWidth(23),
                        ),
                        // TODO fill the name of wight icon in balance icon
                        const Icon(
                          Icons.balance_outlined,
                          color: Colors.white,
                        ),
                        Gap(
                          GetSize.getScreenWidth(5),
                        ),
                        Text(
                          widget.detailInfo['wight'].toString(),
                          style: Styles.headerThreeTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Gap(
                      GetSize.getScreenHeight(10),
                    ),
                    Text(
                      'Big ${widget.detailInfo['name'].toString()}',
                      style: Styles.headerOneTextStyle,
                    ),
                    Gap(
                      GetSize.getScreenHeight(18),
                    ),
                    Text(
                      widget.detailInfo['description'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(
                      GetSize.getScreenHeight(25),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                        vertical: GetSize.getScreenWidth(20),
                        horizontal: GetSize.getScreenHeight(
                          GetSize.getScreenWidth(68),
                        ),
                      ),
                      color: Styles.buttonBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderScreen(orderedItem: widget.detailInfo),
                          ),
                        );
                      },
                      child: Text(
                        'Taste it for\$ ${widget.detailInfo['price']}',
                        style: Styles.buttonTextStyle.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
