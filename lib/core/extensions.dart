import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';



extension ThemeExt on BuildContext {
  /// Theme extensions
  TextStyle get titleStyle => GoogleFonts.inter(
      color: appColor.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w400);

  TextStyle get titleStyleRegular => GoogleFonts.inter(
      color: appColor.whiteColor, fontSize: 18.sp, fontWeight: FontWeight.w500);

  TextStyle get subTitleStyle => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: appColor.whiteColor,
        fontSize: 12.sp,
      );

  TextStyle get subTitleTextStyle => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        color: appColor.whiteColor,
        fontSize: 11.sp,
      );

  TextStyle get subTitleTxtStyle => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: appColor.whiteColor,
        fontSize: 11.sp,
      );

  TextStyle get bodyTxtStyle => GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: appColor.whiteColor);

  TextStyle get bodyTxtStyleTwo => GoogleFonts.inter(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: appColor.whiteColor,
      decoration: TextDecoration.underline,
      decorationColor: appColor.primary);

  TextStyle get smallTxtStyle => GoogleFonts.inter(
        color: appColor.whiteColor,
        fontSize: 10.sp,
      );

  TextStyle get smallTxtStyleBold => GoogleFonts.inter(
        color: appColor.whiteColor,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get titleTextStyle => GoogleFonts.inter(
        color: appColor.whiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get cardTitleStyle => GoogleFonts.inter(
        color: appColor.whiteColor,
        fontSize: 13.76.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get cardTitleStyleWhite => GoogleFonts.inter(
        color: appColor.whiteColor,
        fontSize: 13.76.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dropdownBodyTxtStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get ratingTextStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 40.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get noReviewYetTextStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 33.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get dropdownTitleTxtStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get yourTicketTextStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 13.5.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle get priceBodyTxtStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get orderDetailsHeadingTxtStyle => GoogleFonts.inter(
        color: appColor.blackColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get buttonTxtStyle => GoogleFonts.inter(
        color: appColor.whiteColor,
        fontSize: 15.59.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get bottomNavTextStyle => GoogleFonts.inter(
        fontSize: 9.sp,
        color: appColor.greyColor500,
        fontWeight: FontWeight.w400,
      );

  TextStyle get headingTextStyle => GoogleFonts.inter(
        fontSize: 20.sp,
        color: appColor.blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get mainHeadingTextStyle => GoogleFonts.inter(
        fontSize: 35.sp,
        color: appColor.blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get orderConfirmHeadingTextStyle => GoogleFonts.inter(
        fontSize: 28.sp,
        color: appColor.blackColor,
        fontWeight: FontWeight.w600,
      );
}

/// Build context extensions
extension ContextExtension on BuildContext {


  ///Pops all screen until last screen then replaces it with the required screen

  /// Get color scheme
  ColorScheme get appColor => Theme.of(this).colorScheme;

  /// Get current height of the screen
  double get height => MediaQuery.of(this).size.height;

  /// Get current height of the screen
  double get width => MediaQuery.of(this).size.width;

  /// Provides safe context
  BuildContext? getSafeContext() {
    if (mounted) {
      return this;
    }
    return null;
  }

  /// show global loader

}

extension DateTimeExtension on DateTime? {
  bool? isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isAfter(dateTime);
    }
    return null;
  }






}

/// Color scheme extensions

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension ColorExt on ColorScheme {
  Color get blackColor =>
      brightness == Brightness.light ? const Color(0xff545454) : Colors.white38;

  Color get greyColor600 =>
      brightness == Brightness.light ? const Color(0xff4F4F4F) : Colors.white30;

  Color get greyColor500 =>
      brightness == Brightness.light ? Color(0xff6F6B7D) : Colors.white30;

  Color get greyColor400 =>
      brightness == Brightness.light ? Colors.grey.shade400 : Colors.white30;

  Color get greyColor200 =>
      brightness == Brightness.light ? Colors.grey.shade200 : Colors.white12;

  Color get greyColor300 =>
      brightness == Brightness.light ? Colors.grey.shade300 : Colors.white12;

  Color get greyColor100 =>
      brightness == Brightness.light ? Colors.grey.shade100 : Colors.white12;

  Color get greyColor50 =>
      brightness == Brightness.light ? Color(0xffF8F8F8) : Colors.white12;

  Color get lightBlackColor =>
      brightness == Brightness.light ? Colors.black26 : Colors.white30;

  Color get whiteColor =>
      brightness == Brightness.light ? Colors.white : Colors.black;

  Color get backgroundColor =>
      brightness == Brightness.dark ? const Color(0xFF0F0E17) : Colors.white;

  Color get transparent => Colors.transparent;

  Color get redColor => Colors.red;

  Color get dullRed => Color(0xffE26B6B);

  // Color get reviewColor =>
  //     brightness == Brightness.dark ? Colors.green : const Color(0xff006D60);
  //
  // Color get successColor =>
  //     brightness == Brightness.light ? Colors.green : Colors.green;
  //
  // Color get chatTextColor =>
  //     brightness == Brightness.light ? Colors.blue : Colors.lightBlue;
  Color get smallTextColor => brightness == Brightness.light
      ? const Color(0xFF6A6A6A)
      : const Color(0xFF6A6A6A);
  Color get darkGreen => brightness == Brightness.light
      ? const Color(0xFF1D713E)
      : const Color(0xFF07E55E);

  Color get lightGreen => brightness == Brightness.light
      ? const Color(0xFFEDF8F1)
      : Colors.greenAccent;

  Color get yellow =>
      brightness == Brightness.light ? const Color(0xFFE9A706) : Colors.yellow;
}
