import 'package:covid19_tracker_in_flutter/presentation/controllers/countries_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final CountriesListController controller;
  final textEditing = TextEditingController();

  MyTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.raleway(
      fontSize: 22,
      color: Colors.grey[50],
      height: 0.75,
    );
    return Container(
      transform: Matrix4.translationValues(-15, 0, 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[50])),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.grey[50],
              controller: textEditing,
              onChanged: controller.changeSearchValue,
              style: style,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Pesquisar',
                hintStyle: style,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(() {
            if (!controller.showClearButton) return Container();
            return GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                controller.changeSearchValue('');
                textEditing.clear();
              },
            );
          }),
        ],
      ),
    );
  }
}
