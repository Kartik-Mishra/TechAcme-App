import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class CallService {
  void call(String number) {
    launch("tel:$number");
  }

  void mail(String email) {
    launch("mailto:$email?subject=TechAcme_Query");
  }
  void web(String url)
  {launch("$url");}
}

GetIt locator = GetIt.instance;

void set() {
  locator.registerSingleton(CallService());

}

void main() {
  set();
  runApp(TechAcme_App());
}

class TechAcme_App extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData.dark(),
        home: Homepage());
  }
}

