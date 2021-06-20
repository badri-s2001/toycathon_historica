import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';
import 'package:historica/mythology/pandava/pandava_story_page.dart';
import 'package:historica/mythology/rama/rama_story_page.dart';

class MythologyPage extends StatelessWidget {
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
                    );
                  },
                ),
                TextImageCard(
                  text: "Pandavas",
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
