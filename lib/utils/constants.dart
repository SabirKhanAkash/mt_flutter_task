import 'package:flutter/material.dart';

final InputDecoration searchBoxDecoration = InputDecoration(
  hintText: 'Search by title ',
  hintStyle: const TextStyle(color: Colors.black),
  prefixIcon: const Icon(Icons.search, color: Colors.black),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Colors.black),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Colors.black),
  ),
);

const primaryColor = Color(0xff34b6d4);
const primaryDarkColor = Color(0xff001931);
const lightGray = Color(0xff4dffffff);
const primaryLightColor = Color(0xff006EAC);
const lightWhite = Color(0xffEBF2FC);

const double fontXXS = 12;
const double fontXS = 14;
const double fontS = 16;
const double fontM = 17;
const double fontL = 18;
const double fontXL = 25;
