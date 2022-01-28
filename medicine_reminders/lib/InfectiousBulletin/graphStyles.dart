//import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

///Behaviour of the labels in the graphs
var behaviour = [
  charts.ChartTitle('Date',
      behaviorPosition: charts.BehaviorPosition.bottom,
      titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
      titleStyleSpec:
          charts.TextStyleSpec(color: charts.Color.fromHex(code: "#c8c8c8"))),
  charts.ChartTitle('Cases recorded on Epidemiology week',
      behaviorPosition: charts.BehaviorPosition.start,
      titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
      titleStyleSpec:
          charts.TextStyleSpec(color: charts.Color.fromHex(code: "#c8c8c8"))),
];

///Editing the y-axis for display purposes
///The text and line styles and (if rqd) non zero-bounding the y-axis
var yAxis = charts.NumericAxisSpec(
    /*tickProviderSpec: charts.BasicNumericTickProviderSpec(
                   zeroBound: false),*/
    renderSpec: charts.GridlineRendererSpec(
  labelStyle: charts.TextStyleSpec(color: charts.Color.white, fontSize: 24),
  lineStyle: charts.LineStyleSpec(color: charts.Color.fromHex(code: "#323232")),
));

///Editing the y-axis for display purposes
///The text and line styles
var xAxis = charts.DateTimeAxisSpec(
  renderSpec: charts.GridlineRendererSpec(
    labelStyle: charts.TextStyleSpec(color: charts.Color.white, fontSize: 20),
    lineStyle:
        charts.LineStyleSpec(color: charts.Color.fromHex(code: "#080808")),
    axisLineStyle: charts.LineStyleSpec(
      color: charts.Color.fromHex(code: "#a0a0a0"),
    ),
  ),
  showAxisLine: true,
);
