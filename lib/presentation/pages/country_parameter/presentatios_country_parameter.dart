import 'package:covid19_tracker_in_flutter/presentation/controllers/country_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/widgets/widget_country_information.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/widgets/widget_failed_load.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/widgets/widget_loading.dart';
import 'package:covid19_tracker_in_flutter/presentation/widgets/widgets_updated_at.dart';
import 'package:covid19_tracker_in_flutter/presentation/widgets/widget_informations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryParameter extends StatelessWidget {
  final _controller = CountryController(Get.find());
  final String country;

  CountryParameter({@required this.country}) : assert(country != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        centerTitle: true,
        title: Text(
          country,
          style: GoogleFonts.raleway(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _controller.updateCountryData(country),
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
              future: _controller.getCountryData(country),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Loading();
                if (snapshot.data == false) return FailedLoad(country);

                return Obx(() {
                  final summary = _controller.getCountrySummary;
                  return Column(
                    children: <Widget>[
                      CountryInformation(summary),
                      UpdatedAt(summary.updatedDate),
                      NewInformations(
                        cardTitle: "Casos Confirmados",
                        currentData: summary?.cases,
                        newData: summary?.todayCases,
                        color: Colors.orange[600],
                        titleColor: Colors.orange[800],
                      ),
                      NewInformations(
                        cardTitle: "Recuperados",
                        currentData: summary?.recovered,
                        newData: summary?.todayRecovered,
                        color: Colors.green[600],
                        titleColor: Colors.green[800],
                      ),
                      NewInformations(
                        cardTitle: "Óbitos",
                        currentData: summary?.deaths,
                        newData: summary?.todayDeaths,
                        color: Colors.red[600],
                        titleColor: Colors.red[800],
                      ),
                      SizedBox(height: 100),
                    ],
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
