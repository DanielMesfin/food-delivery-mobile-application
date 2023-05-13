import 'package:flutter/material.dart';
import 'package:food_delivery/constances/Styes.dart';
import 'package:food_delivery/constances/get_size.dart';
import 'package:gap/gap.dart';
import '../screens/order_screen.dart';

class OrederedItem extends StatelessWidget {
  final OrderScreen widget;
  final int eachItemCount;
  final void Function()? increment;
  final void Function()? decrement;
  const OrederedItem(
      {super.key,
      required this.widget,
      required this.eachItemCount,
      required this.increment,
      required this.decrement});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: GetSize.getScreenWidth(1),
            right: GetSize.getScreenWidth(8),
            top: GetSize.getScreenHeight(10),
            bottom: GetSize.getScreenHeight(10),
          ),
          child: CircleAvatar(
            backgroundImage:
                AssetImage('images/${widget.orderedItem['image']}'),
            radius: 33,
          ),
        ),
        Gap(
          GetSize.getScreenWidth(5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.orderedItem['name'],
                    style: Styles.normalTextStyle,
                  ),
                  Gap(GetSize.getScreenWidth(15)),
                  Text(
                    '\$ ${(eachItemCount * widget.orderedItem['price']).toStringAsFixed(2)}',
                    style: Styles.boldTextStyle,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      onTap: decrement,
                      child: const Icon(
                        Icons.remove_circle,
                        size: 27,
                        color: Colors.white,
                      )),
                  Gap(
                    GetSize.getScreenWidth(10),
                  ),
                  Text(
                    eachItemCount.toString(),
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Gap(
                    GetSize.getScreenWidth(10),
                  ),
                  InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      onTap: increment,
                      child: const Icon(Icons.add_circle,
                          size: 27, color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
