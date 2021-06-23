import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';
import 'package:historica/history/history_page.dart';
import 'package:historica/mythology/mythology_page.dart';
import 'package:historica/scientist/scientist_page.dart';
import 'package:mailto/mailto.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sHistory = "";
  String sEpic = "";
  String sScientist = "";

  Future<void> _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int history = 0;
    int ashoka = ((((prefs.getInt('ashoka') ?? 0) + 1) / 13) * 100).toInt();
    int chanakya = ((((prefs.getInt('chanakya') ?? 0) + 1) / 13) * 100).toInt();
    if (ashoka == 100) history++;
    if (chanakya == 100) history++;

    int epic = 0;
    int rama = ((((prefs.getInt('rama') ?? 0) + 1) / 13) * 100).toInt();
    int pandava = ((((prefs.getInt('pandava') ?? 0) + 1) / 15) * 100).toInt();
    if (rama == 100) epic++;
    if (pandava == 100) epic++;

    int scientist = 0;
    int apj = ((((prefs.getInt('apj') ?? 0) + 1) / 9) * 100).toInt();
    int cv = ((((prefs.getInt('cv') ?? 0) + 1) / 9) * 100).toInt();
    if (apj == 100) scientist++;
    if (cv == 100) scientist++;
    sHistory = history.toString() + "/2 completed";

    sEpic = epic.toString() + "/2 completed";

    sScientist = scientist.toString() + "/2 completed";
  }

  @override
  Widget build(BuildContext context) {
    launchMailto() async {
      final mailtoLink = Mailto(
        to: ['s.badrinarayanan791@gmail.com'],
        subject: 'Historica Story suggestion',
      );
      await launch('$mailtoLink');
    }

    launchCredits() async {
      await launch(
        'https://badri-s2001.github.io/toycathon_credits/',
        forceWebView: true,
      );
    }

    return FutureBuilder(
      future: _getScore(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgrounds/home_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage("images/logo/home.png"),
                        width: MediaQuery.of(context).size.width - 50,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextImageCard(
                      text: "History",
                      percentage: sHistory,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/home/history.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.yellow,
                      height: MediaQuery.of(context).size.height / 4.8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    TextImageCard(
                      text: "Epic",
                      percentage: sEpic,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/home/mythology.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height / 4.8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MythologyPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    TextImageCard(
                      text: "Scientist",
                      percentage: sScientist,
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/home/scientist.jpeg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.height / 4.8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScientistPage(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.black54,
                        thickness: 3.0,
                      ),
                    ),
                    TextImageCard(
                      text: "Suggestion",
                      percentage: "Mail us!",
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/home/suggestion.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height / 4.8,
                      onTap: () {
                        launchMailto();
                      },
                    ),
                    TextImageCard(
                      text: "Credits",
                      percentage: "Sources cited",
                      image: DecorationImage(
                        image: AssetImage(
                          "images/card/home/credits.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      color: Colors.teal,
                      height: MediaQuery.of(context).size.height / 4.8,
                      onTap: () {
                        launchCredits();
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
