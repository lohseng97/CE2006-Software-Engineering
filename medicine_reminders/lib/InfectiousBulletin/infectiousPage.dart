import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:permission_handler/permission_handler.dart';

import './Case.dart';
import 'diseaseDB.dart';
import './graphStyles.dart';

final imgUrl =
    "https://www.moh.gov.sg/docs/librariesprovider5/diseases-updates/weekly-infectious-disease-bulletin-year-20214d8f52fe536b446bbf034b0b59e70ca1.xlsx";
int id = (DateTime.now().millisecondsSinceEpoch % 10000000000) ~/ 1000;

///
/// Interface screen for the processing of graphs for the infectious bulletin (Top 3 most Infectious Diseases).
///
/// 3 separate graphs will be obtained and can be toggled between the three with a TabBar
///
/// Author: Lim Jun Wei
///
/// Version: 1.0.2
///
/// Update:
/// - Removed deprecated lists declaration
/// - Split out the Case class and graphStyles
///
/// Since: 14 April 2021
class InfectiousPage extends StatefulWidget {
  final Widget child;
  InfectiousPage({Key key, this.child}) : super(key: key);

  _InfectiousPageState createState() => _InfectiousPageState();
}

class _InfectiousPageState extends State<InfectiousPage> {
  //empty data lists
  List<charts.Series<Case, DateTime>> _mostData = [];
  List<charts.Series<Case, DateTime>> _moreData = [];
  List<charts.Series<Case, DateTime>> _mildData = [];
  var excel, top3;

  //placeholder titles
  var title = "Top common Disease";
  var toTitle = "Next Disease";
  var tooTitle = "Following Disease";

  String fileDownload = "bulletin" + id.toString();

  ///Obtains and formats all required data in the appropriate List form
  ///for the 3 graphs to be sent to the main user interface
  _retrieve() {
    var nofiledata = [
      new Case(new DateTime(2021, 1, 1), 0),
      new Case(new DateTime(2021, 1, 7), 0),
      new Case(new DateTime(2021, 1, 14), 0),
      new Case(new DateTime(2021, 1, 21), 0),
    ];

    excel = DiseaseDatabaseInterface.getExcelData(fileDownload);
    print(excel);

    if (excel != null) {
      top3 = _top3(excel);

      var key;
      var y = 0;
      do {
        y++;
        key = excel.tables['Sheet1'].rows[y][3];
      } while (key != null);

      var locate = excel.tables['Sheet1'];
      y--;

      title = locate.rows[0][top3[0]];
      toTitle = locate.rows[0][top3[1]];
      tooTitle = locate.rows[0][top3[2]];

      var week1 = new DateTime(
          int.parse(locate.rows[y][2].split("/")[2]),
          int.parse(locate.rows[y][2].split("/")[1]),
          int.parse(locate.rows[y][2].split("/")[0].substring(1)));
      var week2 = new DateTime(
          int.parse(locate.rows[y - 1][2].split("/")[2]),
          int.parse(locate.rows[y - 1][2].split("/")[1]),
          int.parse(locate.rows[y - 1][2].split("/")[0].substring(1)));
      var week3 = new DateTime(
          int.parse(locate.rows[y - 2][2].split("/")[2]),
          int.parse(locate.rows[y - 2][2].split("/")[1]),
          int.parse(locate.rows[y - 2][2].split("/")[0].substring(1)));
      var week4 = new DateTime(
          int.parse(locate.rows[y - 3][2].split("/")[2]),
          int.parse(locate.rows[y - 3][2].split("/")[1]),
          int.parse(locate.rows[y - 3][2].split("/")[0].substring(1)));

      var data1 = [
        new Case(week1, locate.rows[y][top3[0]]),
        new Case(week2, locate.rows[y - 1][top3[0]]),
        new Case(week3, locate.rows[y - 2][top3[0]]),
        new Case(week4, locate.rows[y - 3][top3[0]]),
      ];

      var data2 = [
        new Case(week1, locate.rows[y][top3[1]]),
        new Case(week2, locate.rows[y - 1][top3[1]]),
        new Case(week3, locate.rows[y - 2][top3[1]]),
        new Case(week4, locate.rows[y - 3][top3[1]]),
      ];

      var data3 = [
        new Case(week1, locate.rows[y][top3[2]]),
        new Case(week2, locate.rows[y - 1][top3[2]]),
        new Case(week3, locate.rows[y - 2][top3[2]]),
        new Case(week4, locate.rows[y - 3][top3[2]]),
      ];

      _mostData.add(
        charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFFFFA500)),
          id: locate.rows[0][top3[0]],
          data: data1,
          domainFn: (Case disease, _) => disease.dateval,
          measureFn: (Case disease, _) => disease.caseval,
        ),
      );
      _moreData.add(
        charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFFFFFF33)),
          id: locate.rows[0][top3[1]],
          data: data2,
          domainFn: (Case disease, _) => disease.dateval,
          measureFn: (Case disease, _) => disease.caseval,
        ),
      );
      _mildData.add(
        charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFF00FF00)),
          id: locate.rows[0][top3[2]],
          data: data3,
          domainFn: (Case disease, _) => disease.dateval,
          measureFn: (Case disease, _) => disease.caseval,
        ),
      );
    }

    ///When the data has not be obtained yet(initial state)
    else {
      DiseaseDatabaseInterface.download(imgUrl, fileDownload, 'xlsx');
      _mostData.add(
        charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFFFF0000)),
          id: title,
          data: nofiledata,
          domainFn: (Case disease, _) => disease.dateval,
          measureFn: (Case disease, _) => disease.caseval,
        ),
      );

      _moreData.add(
        charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFFFF0000)),
          id: toTitle,
          data: nofiledata,
          domainFn: (Case disease, _) => disease.dateval,
          measureFn: (Case disease, _) => disease.caseval,
        ),
      );
      _mildData.add(
        charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFFFF0000)),
          id: tooTitle,
          data: nofiledata,
          domainFn: (Case disease, _) => disease.dateval,
          measureFn: (Case disease, _) => disease.caseval,
        ),
      );
    }
  }

  ///for downloading and refreshing the page
  void download() {
    setState(() {
      DiseaseDatabaseInterface.download(imgUrl, fileDownload, 'xlsx');
      _mostData.clear();
      _moreData.clear();
      _mildData.clear();
      _retrieve();
    });
  }

  ///Obtains storage permission for the application
  /// for this case, it is only required for this top 3 diseases feature
  void getPermission() async {
    print("getPermission");
    Map<Permission, PermissionStatus> permissions =
        await [Permission.storage].request();
  }

  @override
  void initState() {
    super.initState();
    getPermission();
    _retrieve();
  }

  ///building the interface to be called by the UI page
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(text: "Most Common"), // icon: Icon(Icons.warning_sharp)),
            Tab(text: "Second"), // icon: Icon(Icons.warning_amber_sharp)),
            Tab(text: "Third") //, icon: Icon(Icons.error_outline)),
          ],
          labelColor: Colors.red,
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, top: 8.0, right: 8.0, bottom: 60.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: charts.TimeSeriesChart(
                          _mostData,
                          defaultRenderer: new charts.LineRendererConfig(
                              includeArea: true, includePoints: true),
                          animate: true,
                          animationDuration: Duration(seconds: 1),
                          behaviors: behaviour,
                          primaryMeasureAxis: yAxis,
                          domainAxis: xAxis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, top: 8.0, right: 8.0, bottom: 60.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        toTitle,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: charts.TimeSeriesChart(
                          _moreData,
                          defaultRenderer: new charts.LineRendererConfig(
                              includeArea: true, includePoints: true),
                          animate: true,
                          animationDuration: Duration(seconds: 1),
                          behaviors: behaviour,
                          primaryMeasureAxis: yAxis,
                          domainAxis: xAxis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, top: 8.0, right: 8.0, bottom: 60.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        tooTitle,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: charts.TimeSeriesChart(
                          _mildData,
                          defaultRenderer: new charts.LineRendererConfig(
                              includeArea: true, includePoints: true),
                          animate: true,
                          animationDuration: Duration(seconds: 1),
                          behaviors: behaviour,
                          primaryMeasureAxis: yAxis,
                          domainAxis: xAxis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            id = (DateTime.now().millisecondsSinceEpoch % 10000000000) ~/ 1000;
            download();
          },
          tooltip: 'refresh',
          child: Icon(Icons.autorenew),
        ),
      ),
    );
  }
}

//variables below is for display purposes

///Finding the top 3 diseases from the data retrieved
_top3(var excel) {
  var noCases = [-1, -1, -1];
  var maxX = excel.tables['Sheet1'].maxCols;
  var maxY = excel.tables['Sheet1'].maxRows;

  var x, key;
  var y = 0;
  do {
    y++;
    key = excel.tables['Sheet1'].rows[y][3];
  } while (key != null);
  maxY = y - 1;

  //adding
  for (x = 3; x < maxX; x++) {
    noCases.add(0);
    for (y = 0; y < 4; y++) {
      if (excel.tables['Sheet1'].rows[maxY - y][x] is double) {
        maxX = x;
        y = 4;
      } else
        noCases[x] += excel.tables['Sheet1'].rows[maxY - y][x];
    }
  }

  //find top
  var chosen = 3; //number of top diseases
  var no = 3;
  var highNow;
  var top = [-1, -1, -1];

  for (key = 0; key < chosen; key++) {
    highNow = noCases[3];
    while (no < maxX) {
      if (highNow < noCases[no]) {
        top[key] = no;
        highNow = noCases[top[key]];
      }
      no++;
    }
    noCases[top[key]] = -1;
    no = 3;
  }

  return top;
}
