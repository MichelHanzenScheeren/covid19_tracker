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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/covid.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleHome(
                title: 'Covid-19',
                subtitle: 'Tracker in Flutter',
              ),
              OptionsHome(
                title: 'Informações',
                top: 70.0,
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
                down: 70.0,
                onClick: () => Get.to(CountriesList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
