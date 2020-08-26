import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ornek_proje/models/burc_ozellikleri.dart';
import 'package:ornek_proje/pages/burc_detaylari.dart';
import 'package:ornek_proje/ut/strings.dart';

class BurcListeleri extends StatelessWidget {
  static List<BurcOzellikleri> burcHolder = burcOlustur();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.black,
        title: Text(
          "BURC REHBERİ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.info),
      ),
      body: burclariGetir(),
    );
  }

  static List<BurcOzellikleri> burcOlustur() {
    List<BurcOzellikleri> geciciBurcHolder = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png"; //koc1.png
      String buyukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "_buyuk${i + 1}.png"; //koc_buyuk1.png

      BurcOzellikleri eklenecekBurc = BurcOzellikleri(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);

      geciciBurcHolder.add(eklenecekBurc);
    }
    return geciciBurcHolder;
  }

  Widget burclariGetir() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekBurc(context, index);
      },
      padding: EdgeInsets.all(5),
      itemCount: burcHolder.length,
    );
  }

  Widget tekBurc(BuildContext context, int index) {
    return Card(
      elevation: 5,
      color: Colors.red.shade400,
      //margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          onTap: () {
            
            Navigator.pushNamed(context, "/BurcDetaylari/${index}");
          },
          leading: Image.asset(
            "lib/images/${burcHolder[index].kucukResim}",
            height: 50,
            width: 50,

          ),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text(
            burcHolder[index].burcAdi,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          subtitle: Text(
            burcHolder[index].burcTarih,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
