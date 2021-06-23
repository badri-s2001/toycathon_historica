import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import 'ashoka/ashoka_story_page.dart';
import 'chanakya/chanakya_story_page.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String sAshoka = "";
  String sChanakya = "";

  Future<void> _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sAshoka = "0% completed";
    sChanakya = "0% completed";
    if (prefs.getInt('ashoka') != null) {
      int ashoka = prefs.getInt('ashoka');
      sAshoka = (((ashoka + 1) / 13) * 100).toInt().toString() + "% completed";
    }
    if (prefs.getInt('chanakya') != null) {
      int chanakya = prefs.getInt('chanakya');
      sChanakya =
          (((chanakya + 1) / 13) * 100).toInt().toString() + "% completed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getScore(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgrounds/history_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage("images/logo/history.png"),
                        width: MediaQuery.of(context).size.width - 50,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextImageCard(
                      text: "Ashoka",
                      percentage: sAshoka,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/history/ashoka.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.deepPurpleAccent,
                      height: MediaQuery.of(context).size.height / 3.5,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AshokaStoryPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    TextImageCard(
                      text: "Chanakya",
                      percentage: sChanakya,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/history/chanakya.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.tealAccent,
                      height: MediaQuery.of(context).size.height / 3.5,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChanakyaStoryPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
