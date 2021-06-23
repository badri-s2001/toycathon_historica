import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';
import 'package:historica/mythology/pandava/pandava_story_page.dart';
import 'package:historica/mythology/rama/rama_story_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class MythologyPage extends StatefulWidget {
  @override
  _MythologyPageState createState() => _MythologyPageState();
}

class _MythologyPageState extends State<MythologyPage> {
  String sRama = "";
  String sPandavas = "";

  Future<void> _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sRama = "0% completed";
    sPandavas = "0% completed";
    if (prefs.getInt('rama') != null) {
      int rama = prefs.getInt('rama');
      sRama = (((rama + 1) / 13) * 100).toInt().toString() + "% completed";
    }
    if (prefs.getInt('pandava') != null) {
      int pandava = prefs.getInt('pandava') ?? 0;
      sPandavas =
          (((pandava + 1) / 15) * 100).toInt().toString() + "% completed";
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
                  image: AssetImage("images/backgrounds/epic_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage("images/logo/myth.png"),
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextImageCard(
                        text: "Rama",
                        percentage: sRama,
                        image: DecorationImage(
                          image: AssetImage(
                            "images/card/mythology/rama.jpeg",
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        color: Colors.deepOrangeAccent,
                        height: MediaQuery.of(context).size.height / 3.5,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RamaStoryPage(),
                            ),
                          ).then((value) => setState(() {}));
                        },
                      ),
                      TextImageCard(
                        text: "Pandavas",
                        percentage: sPandavas,
                        image: DecorationImage(
                          image: AssetImage(
                            "images/card/mythology/pandavas.jpeg",
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        color: Colors.blue,
                        height: MediaQuery.of(context).size.height / 3.5,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PandavaStoryPage(),
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
        });
  }
}
