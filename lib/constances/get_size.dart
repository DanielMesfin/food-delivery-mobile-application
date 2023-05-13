import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GetSize {
  static getSize(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static getHeightOf() {
    return Get.height;
  }

  static getWidthOf() {
    return Get.width;
  }

  static getScreenHeight(double pixels) {
    double h = getHeightOf() / pixels;
    return getHeightOf() / h;
  }

  static getScreenWidth(double pixels) {
    double w = getWidthOf() / pixels;
    return getWidthOf() / w;
  }
}