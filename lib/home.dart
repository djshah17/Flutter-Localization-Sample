import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlocalizationsample/application_localizations.dart';
import 'package:flutterlocalizationsample/application_localizations_delegate.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("player_name") + " : Cristiano Ronaldo", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("club_name") + " : Juventus", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("country") + " : Portugal", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Divider(thickness: 3),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("player_name") + " : Lionel Messi", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("club_name") + " : Barcelona", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("country") + " : Argentina", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Divider(thickness: 3),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("player_name") + " : Neymar Jr.", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("club_name") + " : Paris Saint-Germain", style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              Text(ApplicationLocalizations.of(context).translate("country") + " : Brazil", style: TextStyle(fontSize: 22)),
            ],
          ),
        )
      ),
    );
  }



}