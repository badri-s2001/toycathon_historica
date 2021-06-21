import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';

import 'ashoka/ashoka_story_page.dart';
import 'chankaya/chanakya_story_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage("images/logo/history.png"),
                  width: 250,
                  height: 250,
                ),
              ),
              TextImageCard(
                text: "Ashoka",
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
                  );
                },
              ),
              TextImageCard(
                text: "Chanakya",
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
