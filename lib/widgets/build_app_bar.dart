import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String img, required String title, required double w}) {
  return AppBar(
    foregroundColor: kSecondaryColor,
    backgroundColor: kPrimaryColor,
    title: ChatAppBarTitle( img: img, title: title, w: w),
  );
}
