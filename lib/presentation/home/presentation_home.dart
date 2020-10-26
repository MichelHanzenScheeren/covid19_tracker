import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/covid.jpeg"), fit: BoxFit.cover),
          ),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              Text(
                "Covid-19",
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 60.0),
              ),
              Text(
                "Tracker in Flutter",
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 30.0),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 10.0),
                  child: ButtonTheme(
                    minWidth: 350.0,
                    height: 60.0,
                    child: RaisedButton(
                      child: Text(
                        'Informações',
                        style: GoogleFonts.raleway(
                            fontSize: 33.0, color: Colors.white70),
                      ),
                      color: Colors.red[200].withOpacity(0.6),
                      elevation: 4.0,
                      splashColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      onPressed: () {
                        // faz alguma coisa
                      },
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                  child: ButtonTheme(
                    minWidth: 350.0,
                    height: 60.0,
                    child: RaisedButton(
                      child: Text(
                        'Parâmetro Geral',
                        style: GoogleFonts.raleway(
                            fontSize: 33.0, color: Colors.white70),
                      ),
                      color: Colors.red[200].withOpacity(0.6),
                      elevation: 4.0,
                      splashColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      onPressed: () {
                        // faz alguma coisa
                      },
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 70.0),
                  child: ButtonTheme(
                    minWidth: 350.0,
                    height: 60.0,
                    child: RaisedButton(
                      child: Text(
                        'Últimas Pesquisas',
                        style: GoogleFonts.raleway(
                            fontSize: 33.0, color: Colors.white70),
                      ),
                      color: Colors.red[200].withOpacity(0.6),
                      elevation: 4.0,
                      splashColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      onPressed: () {
                        // faz alguma coisa
                      },
                    ),
                  ))
            ]),
          )),
    );
  }
}
