import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UpdatedAt extends StatelessWidget {
  final DateTime updated;

  UpdatedAt(this.updated);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Divider(color: Colors.grey[700])),
          Text(
            " Atualizado ${_formatData()} às ${_formatTime()} ",
            style: GoogleFonts.raleway(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
          Expanded(child: Divider(color: Colors.grey[700])),
        ],
      ),
    );
  }

  String _formatData() => DateFormat('dd/MM/yy').format(updated);

  String _formatTime() => DateFormat('HH:mm:ss').format(updated);
}
