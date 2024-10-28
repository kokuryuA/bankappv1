import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/painting/text_style.dart';
class LineTitles {
  static getTitleData() => FlTitlesData(
    show : true ,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 22,

      getTitles: (value) {
        switch (value.toInt())  {
          case 2: return 'Mar' ;
          case 4:return 'APRIL';
          case 8: return 'SEP';

  }
     return '';},


      margin: 8,
    ),
      leftTitles: SideTitles(
        showTitles: true ,
        getTitles: (value) {
  switch (value.toInt())  {
  case 1: return '10k' ;
  case 4:return '40k';
  case 8: return '80k';
  }
        return '';},
        reservedSize: 28,
        margin: 12,


  )

  );
}
