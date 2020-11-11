import 'package:covid19_tracker_in_flutter/presentation/pages/countries_list/presentation_countries_list.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/general_parameter/presentation_general_parameter.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/home/widget/widget_home.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/home/widget/widget_title.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/information/presentation_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/covid.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TitleHome(
                title: 'Covid-19',
                subtitle: 'Tracker in Flutter',
              ),
              OptionsHome(
                title: 'Informações',
                top: MediaQuery.of(context).size.height * 0.17,
                down: 10.0,
                onClick: () => Get.to(Information()),
              ),
              OptionsHome(
                title: 'Parâmetro Geral',
                top: 15.0,
                down: 10.0,
                onClick: () => Get.to(GeneralParameter()),
              ),
              OptionsHome(
                title: 'Lista de Países',
                top: 15.0,
                down: 50.0,
                onClick: () => Get.to(CountriesList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
