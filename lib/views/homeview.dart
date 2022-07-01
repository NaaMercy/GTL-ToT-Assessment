import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.soilData, this.ghgData}) : super(key: key);
  final soilData;
  final ghgData;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var n = NumberFormat("###.0#");
  late var moisture;
  late var temperature;
  late var ghgmessage;
  late String ozone;
  late String co2;
  late String ch4;
  late String watervapor;

  @override
  void initState() {
    super.initState();
    latestDetailUi(widget.ghgData, widget.soilData);
  }

  void latestDetailUi(dynamic ghgData, dynamic soilData) {
    setState(() {
      temperature = soilData['data'][0]['soil_temperature'];
      moisture = soilData['data'][0]['soil_moisture'];
      if (ghgData['data'].toString() == '[]') {
        ghgmessage = ghgData['message'];
      } else {
        ozone = ghgData['data'][0]['ozone']['value'];
        co2 = ghgData['data'][0]['co2']['value'];
        ch4 = ghgData['data'][0]['ch4']['value'];
        watervapor = ghgData['data'][0]['water_vapor']['value'].toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/seedling.gif'),
            const SizedBox(height: 30),
            const Text(
              'Soil Latest: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Soil Temperature: ${n.format(temperature)} °C',
            ),
            Text(
              'Soil Moisture: ${n.format(moisture)} %',
            ),
            const SizedBox(height: 5),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 5),
            const Text(
              "GHG Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              'Ozone: ${n.format(ozone)} molecules/cm2',
            ),
            Text(
              'CO2: ${n.format(co2)} ppmv',
            ),
            Text(
              'CH4: ${n.format(ch4)} molecules/cm2',
            ),
            Text(
              'Water Vapor: ${n.format(watervapor)} cm',
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('View History'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
