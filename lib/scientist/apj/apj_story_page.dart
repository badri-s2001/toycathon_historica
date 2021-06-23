// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'apj_story_brain.dart';

class APJStoryPage extends StatefulWidget {
  @override
  _APJStoryPageState createState() => _APJStoryPageState();
}

class _APJStoryPageState extends State<APJStoryPage> {
  APJStoryBrain storyBrain = APJStoryBrain();

  FlutterTts flutterTts = FlutterTts();
  String language = "en-IN";
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.7;

  _speak(String text) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage(language);

    await flutterTts.speak(text);
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = 0.0;
    String storyName = "";
    AssetImage storyImage = new AssetImage("images/cv/story1.jpg");
    String choice1 = "";
    String choice2 = "";
    Future<void> _getStory() async {
      percentage = await storyBrain.getPercentage();
      storyName = await storyBrain.getStory();
      storyImage = await storyBrain.getImage();
      choice1 = await storyBrain.getChoice1();
      choice2 = await storyBrain.getChoice2();
    }

    return FutureBuilder(
        future: _getStory(),
        builder: (context, snapshot) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("images/backgrounds/scientist_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 50, 15, 25),
              constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(3.0),
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 2,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width / 3,
                        lineHeight: 30.0,
                        percent: percentage,
                        center: Text(
                          (percentage * 100).toInt().toString() + "%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.blue,
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(3.0),
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.restart_alt,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 2,
                                ),
                                Text(
                                  "Reset",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            storyBrain.reset();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  storyName,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          _speak(storyName);
                        },
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                      ),
                      TextButton(
                        onPressed: _stop,
                        child: Icon(
                          Icons.stop,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: storyImage,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            // Choice 1 made by user.
                            _stop();
                            final player = AudioCache();
                            player.play('sound1.mp3');
                            storyBrain.nextStory(1);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            choice1,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              _stop();
                              final player = AudioCache();
                              player.play('sound2.mp3');
                              storyBrain.nextStory(2);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              choice2,
                              style: TextStyle(
                                fontSize: 14.0,
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
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }
}
