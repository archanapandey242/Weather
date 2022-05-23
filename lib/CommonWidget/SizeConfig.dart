import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double devicePixelRatio;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double font24;
  static double font15;
  static double font17;
  static double font11;

  static double padding12;
  static double padding16;
  static double padding10;
  static double padding8;
  static double padding32;
  static double padding50;
  static double padding72;
  static double padding170;
  static double padding6;
  static double padding45;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;



    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 100;

    font24 = (screenWidth - _safeAreaHorizontal)/15;//24
    font11 = (screenWidth - _safeAreaHorizontal)/31.6;//11
    font15 = (screenWidth - _safeAreaHorizontal)/24;//15
    font11 = (screenWidth - _safeAreaHorizontal)/31.6;//11
    font17 = (screenWidth - _safeAreaHorizontal)/21;//17


    padding12 = (screenWidth - _safeAreaHorizontal)/30;//12
    padding16 = (screenWidth - _safeAreaHorizontal)/22.5;//16
    padding10 = (screenWidth - _safeAreaHorizontal)/36;//10
    padding8 = (screenWidth - _safeAreaHorizontal)/45;//8
    padding32 = (screenWidth - _safeAreaHorizontal)/11;//32
    padding72 = (screenWidth - _safeAreaHorizontal)/5;//72
    padding50 = (screenWidth - _safeAreaHorizontal)/7.2;//50
    padding170 = (screenWidth - _safeAreaHorizontal)/2.41;//140
    padding6 = (screenWidth - _safeAreaHorizontal)/60;//6
    padding45 = (screenWidth - _safeAreaHorizontal)/9+5;//45
  }
}