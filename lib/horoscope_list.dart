import 'package:flutter/material.dart';
import 'package:flutter_application_horoscope/models/horoscope.dart';
import 'package:flutter_application_horoscope/utils/strings.dart';

class HoroscopeList extends StatelessWidget {
  static List<ZodiacSign> allZodiacSigns = prepareDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope Guide"),
      ),
      body: prepareList(),
    );
  }

  static List<ZodiacSign> prepareDataSource() {
    List<ZodiacSign> zodiacSigns = [];

    for (int i = 0; i < 12; i++) {
      String smallImage = Strings.HOROSCOPE_NAMES[i].toLowerCase() +
          "${i + 1}.png"; // Aries->aries1.png
      String largeImage = Strings.HOROSCOPE_NAMES[i].toLowerCase() +
          "_large" +
          "${i + 1}.png"; // Aries->aries_large1.png

      ZodiacSign newZodiacSign = ZodiacSign(
          Strings.HOROSCOPE_NAMES[i],
          Strings.HOROSCOPE_DATES[i],
          Strings.HOROSCOPE_GENERAL_CHARACTERISTICS[i],
          smallImage,
          largeImage);
      zodiacSigns.add(newZodiacSign);
    }

    return zodiacSigns;
  }

  Widget prepareList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return singleZodiacSignRow(context, index);
      },
      itemCount: allZodiacSigns.length,
    );
  }

  Widget singleZodiacSignRow(BuildContext context, int index) {
    ZodiacSign currentZodiacSign = allZodiacSigns[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/horoscopeDetail/$index"),
          leading: Image.asset(
            "images/" + currentZodiacSign.smallImage,
            width: 64,
            height: 64,
          ),
          title: Text(
            currentZodiacSign.name,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              currentZodiacSign.date,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black38),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink),
        ),
      ),
    );
  }
}
