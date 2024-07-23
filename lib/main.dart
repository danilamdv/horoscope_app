import 'package:flutter/material.dart';
import 'package:flutter_application_horoscope/horoscope_details.dart';
import 'package:flutter_application_horoscope/horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horoscope Guide",
      debugShowCheckedModeBanner: false,
      initialRoute: "/horoscopeList",
      routes: {
        "/": (context) => HoroscopeList(),
        "/horoscopeList": (context) => HoroscopeList(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements =
            settings.name!.split("/"); //  /  horoscopeDetail  /    1
        if (pathElements.length > 1 &&
            pathElements[1] == 'horoscopeDetail' &&
            pathElements.length > 2) {
          return MaterialPageRoute(
              builder: (context) =>
                  HoroscopeDetail(int.parse(pathElements[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
