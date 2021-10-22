import 'package:flutter/material.dart';

double getPhoneWidth(BuildContext context) {
  //Telefonun genişlik değerini döndüren fonksiyon
  double phoneWidth = MediaQuery.of(context).size.width;
  return phoneWidth;
}

double getPhoneHeight(BuildContext context) {
  //Telefonun yükseklik değerini döndüren fonksiyon
  double phoneWidth = MediaQuery.of(context).size.height;
  return phoneWidth;
}