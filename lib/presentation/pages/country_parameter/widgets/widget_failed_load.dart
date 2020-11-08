import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/presentatios_country_parameter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FailedLoad extends StatelessWidget {
  final String country;
  FailedLoad(this.country);

  @override
  Widget build(BuildContext context) {
    print('Abri');
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Infelizmente, não foi possível carregar os dados do país...',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 22,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Icon(Icons.error, size: 80, color: Colors.red),
          SizedBox(height: 50),
          RaisedButton(
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.redAccent[100]),
            ),
            onPressed: () {
              Get.back();
              Get.to(CountryParameter(country: country));
            },
            color: Colors.redAccent[100],
            child: Text(
              'TENTAR NOVAMENTE',
              style: GoogleFonts.raleway(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
