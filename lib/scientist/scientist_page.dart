import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import 'apj/apj_story_page.dart';
import 'cv/cv_story_page.dart';

class ScientistPage extends StatefulWidget {
  @override
  _ScientistPageState createState() => _ScientistPageState();
}

class _ScientistPageState extends State<ScientistPage> {
  String sAPJ = "";
  String sCV = "";

  Future<void> _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sAPJ = "0% completed";
    sCV = "0% completed";
    if (prefs.getInt('apj') != null) {
      int apj = prefs.getInt('apj');
      sAPJ = (((apj + 1) / 9) * 100).toInt().toString() + "% completed";
    }
    if (prefs.getInt('cv') != null) {
      int cv = prefs.getInt('cv') ?? 0;
      sCV = (((cv + 1) / 9) * 100).toInt().toString() + "% completed";
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
                  image:
                      AssetImage("images/backgrounds/scientist_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage("images/logo/science.png"),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    TextImageCard(
                      text: "Kalam",
                      percentage: sAPJ,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/scientist/kalam.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.green,
                      height: MediaQuery.of(context).size.height / 3.5,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => APJStoryPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    TextImageCard(
                      text: "C V Raman",
                      percentage: sCV,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/scientist/cvraman.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.pinkAccent,
                      height: MediaQuery.of(context).size.height / 3.5,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CVStoryPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
