import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_in_flutter/sales_data.dart';
import 'package:charts_in_flutter/other_bar_chart.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget chartContainer = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text('Chart Viewer')],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Charts in Flutter'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: chartContainer,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Bar Charts'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Simple'),
                    onPressed: () {
                      setState(() {
                        chartContainer = SimpleBarChart.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Stacked'),
                    onPressed: () {
                      setState(() {
                        chartContainer = StackedBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Grouped'),
                    onPressed: () {
                      setState(() {
                        chartContainer = GroupedBarChart.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Grouped Stacked'),
                    onPressed: () {
                      setState(() {
                        chartContainer = GroupedStackedBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Grouped Target Line'),
                    onPressed: () {
                      setState(() {
                        chartContainer = GroupedBarTargetLineChart.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Stacked Horizontal'),
                    onPressed: () {
                      setState(() {
                        chartContainer = StackedHorizontalBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Stacked Target Line'),
                    onPressed: () {
                      setState(() {
                        chartContainer = StackedBarTargetLineChart.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Horizontal'),
                    onPressed: () {
                      setState(() {
                        chartContainer = HorizontalBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Horizontal Bar Label'),
                    onPressed: () {
                      setState(() {
                        chartContainer = HorizontalBarLabelChart.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Vertical Bar Label'),
                    onPressed: () {
                      setState(() {
                        chartContainer = VerticalBarLabelChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Spark Bar'),
                    onPressed: () {
                      setState(() {
                        chartContainer = SparkBar.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Grouped Fill Color'),
                    onPressed: () {
                      setState(() {
                        chartContainer = GroupedFillColorBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Stacked Fill Color'),
                    onPressed: () {
                      setState(() {
                        chartContainer = StackedFillColorBarChart.withSampleData();
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Pattern Forward Hatch'),
                    onPressed: () {
                      setState(() {
                        chartContainer = PatternForwardHatchBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Horizontal Pattern Forward Hatch'),
                    onPressed: () {
                      setState(() {
                        chartContainer = HorizontalPatternForwardHatchBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Grouped Stacked Weight Pattern'),
                    onPressed: () {
                      setState(() {
                        chartContainer = GroupedStackedWeightPatternBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Custom Rounded Bars'),
                    onPressed: () {
                      setState(() {
                        chartContainer = CustomRoundedBars.withSampleData();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
