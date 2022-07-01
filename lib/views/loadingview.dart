import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:soil_app/controllers/location.dart';
import 'package:soil_app/models/ghg.dart';
import 'package:soil_app/models/soil.dart';
import 'package:soil_app/views/homeview.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Soil soil = Soil();
  Ghg ghg = Ghg();
  Location location = Location();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var point = await location.determinePosition();
    double lati = point.latitude;
    double longi = point.longitude;
    var soildata = await soil.getSoilLatest(lati, longi);

    //correct this to ghg later
    var ghgdata = await ghg.getGhgLatest(lati, longi);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeView(
        soilData: soildata,
        ghgData: ghgdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingBouncingGrid.square(
            backgroundColor: Colors.green,
            size: 100,
          ),
          const SizedBox(height: 30),
          const Text('Getting details...'),
        ],
      )),
    );
  }
}
