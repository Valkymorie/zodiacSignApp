import 'package:flutter/material.dart';
import 'package:ornek_proje/pages/burc_detaylari.dart';
import 'package:ornek_proje/pages/burc_listeleri.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/BurcListeleri',

      routes: {
        '/': (context) => BurcListeleri(),
        '/BurcListeleri': (context) => BurcListeleri(),
      },

      onGenerateRoute: (RouteSettings settings) {
        List<String> path = settings.name.split("/"); // /BurcDetaylari/${index}
        return path[1] == 'BurcDetaylari'
            ? MaterialPageRoute(
                builder: (context) => BurcDetaylari(int.parse(path[2])))
            : () {};
      },

      debugShowCheckedModeBanner: false,
      //darkTheme: ThemeData.dark(),
      color: Colors.red,
      title: "BURC REHBERİ",
      //home: BurcListeleri(),
    );
  }
}
