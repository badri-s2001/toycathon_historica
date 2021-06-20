import 'package:flutter/material.dart';
import 'package:historica/components/text_image_card.dart';

import 'apj/apj_story_page.dart';
import 'cv/cv_story_page.dart';

class ScientistPage extends StatelessWidget {
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
                  );
                },
              ),
              TextImageCard(
                text: "C V Raman",
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
