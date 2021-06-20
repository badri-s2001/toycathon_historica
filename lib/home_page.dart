import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';
import 'package:historica/history/history_page.dart';
import 'package:historica/mythology/mythology_page.dart';
import 'package:historica/scientist/scientist_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
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
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextImageCard(
                  text: "History",
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
                    );
                  },
                ),
                TextImageCard(
                  text: "Epic",
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
                    );
                  },
                ),
                TextImageCard(
                  text: "Scientist",
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
