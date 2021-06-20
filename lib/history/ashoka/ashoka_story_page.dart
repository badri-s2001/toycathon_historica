// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'ashoka_story_brain.dart';

class AshokaStoryPage extends StatefulWidget {
  _AshokaStoryPageState createState() => _AshokaStoryPageState();
}

class _AshokaStoryPageState extends State<AshokaStoryPage> {
  AshokaStoryBrain storyBrain = AshokaStoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        color: const Color.fromRGBO(255, 255, 255, 0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            storyBrain.getStory(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.brown[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 6,
                child: Center(
                  child: Image(
                    image: storyBrain.getImage(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                // ignore: deprecated_member_use
                child: Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.redAccent,
                      ],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        // Choice 1 made by user.
                        final player = AudioCache();
                        player.play('sound1.mp3');
                        storyBrain.nextStory(1);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        storyBrain.getChoice1(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.purpleAccent,
                        ],
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                      ),
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          final player = AudioCache();
                          player.play('sound2.mp3');
                          storyBrain.nextStory(2);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          storyBrain.getChoice2(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  visible: storyBrain.buttonShouldBeVisible(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
