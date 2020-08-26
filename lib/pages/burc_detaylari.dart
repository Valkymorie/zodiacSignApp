import 'package:flutter/material.dart';
import 'package:ornek_proje/models/burc_ozellikleri.dart';
import 'package:ornek_proje/pages/burc_listeleri.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetaylari extends StatefulWidget {
  int index;

  BurcDetaylari(this.index);

  @override
  _BurcDetaylariState createState() => _BurcDetaylariState();

}

class _BurcDetaylariState extends State<BurcDetaylari> {
  BurcOzellikleri gelenBurc;
  Color renk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gelenBurc = BurcListeleri.burcHolder[widget.index];
    renkBul();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: renk != null ? renk : Colors.red.shade200,
            pinned: true,
            primary: true,
            expandedHeight: 200,
            flexibleSpace: Image.asset(
              "lib/images/${gelenBurc.buyukResim}",
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: Text(
              "${gelenBurc.burcAdi.toUpperCase()} BURCUNUN ÖZELLİKLERİ",
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            elevation: 5,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: renk != null ? renk : Colors.red.shade200,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(5),
                primary: true,
                child: Text(
                  "${gelenBurc.burcOzellik}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),


    );
  }

  void renkBul(){
    Future<PaletteGenerator> fpaletgenerator = PaletteGenerator.fromImageProvider(AssetImage("lib/images/${gelenBurc.buyukResim}"));
    fpaletgenerator.then((value){
      paletteGenerator = value;
      setState(() {
        renk =paletteGenerator.vibrantColor.color;
      });
    });


  }
}
