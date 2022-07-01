import 'package:flutter/material.dart';
import 'package:soil_app/views/loadingview.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('assets/energyshares.gif'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const LoadingView())),
              );
            },
            child: const Text('Get Soil Data'),
          ),
        ],
      ),
    );
  }
}
