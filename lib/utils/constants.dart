import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';

ButtonStyle albumPrevButtonStyle(AlbumDataProvider data) {
  return ButtonStyle(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(9));
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (data.pageNo == 1) {
        return lightGray;
      } else {
        if (states.contains(WidgetState.pressed)) {
          return primaryDarkColor;
        } else {
          return primaryColor;
        }
      }
    }),
  );
}

ButtonStyle photoPrevButtonStyle(PhotoDataProvider data) {
  return ButtonStyle(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(9));
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (data.pageNo == 1) {
        return lightGray;
      } else {
        if (states.contains(WidgetState.pressed)) {
          return primaryDarkColor;
        } else {
          return primaryColor;
        }
      }
    }),
  );
}

ButtonStyle albumNextButtonStyle(AlbumDataProvider data) {
  return ButtonStyle(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(9));
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (data.pageNo == 10) {
        return lightGray;
      } else {
        if (states.contains(WidgetState.pressed)) {
          return primaryDarkColor;
        } else {
          return primaryColor;
        }
      }
    }),
  );
}

ButtonStyle photoNextButtonStyle(PhotoDataProvider data) {
  return ButtonStyle(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(9));
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (data.pageNo == 5) {
        return lightGray;
      } else {
        if (states.contains(WidgetState.pressed)) {
          return primaryDarkColor;
        } else {
          return primaryColor;
        }
      }
    }),
  );
}

final InputDecoration searchBoxDecoration = InputDecoration(
  hintText: 'Search by title',
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

const double fontXXS = 12;
const double fontXS = 14;
const double fontS = 16;
const double fontM = 17;
const double fontL = 18;
const double fontXL = 25;
