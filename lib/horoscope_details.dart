import 'package:flutter/material.dart';
import 'package:flutter_application_horoscope/horoscope_list.dart';
import 'package:flutter_application_horoscope/models/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetail extends StatefulWidget {
  final int selectedIndex;

  HoroscopeDetail(this.selectedIndex);

  @override
  HoroscopeDetailState createState() {
    return HoroscopeDetailState();
  }
}

class HoroscopeDetailState extends State<HoroscopeDetail> {
  late ZodiacSign selectedZodiacSign;
  Color dominantColor = Colors.pink;
  late PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    selectedZodiacSign = HoroscopeList.allZodiacSigns[widget.selectedIndex];
    findDominantColor();
  }

  void findDominantColor() {
    Future<PaletteGenerator> fPaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + selectedZodiacSign.largeImage));
    fPaletteGenerator.then((value) {
      paletteGenerator = value;

      setState(() {
        dominantColor = paletteGenerator.vibrantColor?.color ?? Colors.pink;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: dominantColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + selectedZodiacSign.largeImage,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  selectedZodiacSign.name + " Horoscope and Characteristics",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                selectedZodiacSign.details,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
