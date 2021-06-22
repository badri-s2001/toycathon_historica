import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import '../../story.dart';

class PandavaStoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
          'Pandavas were went to exile after they were defeated in the game of dice. One day in exile, Bhima went in search of water, he saw a lake with mysterious Yaksha. Yaksha said to Bhima "I will leave you to take water, if you answer my questions correctly or else will kill you". Help Bhima to handle the situation.',
      choice1: 'Accept Yaksha challenge and try to answer questions correctly',
      choice2:
          'Bhima has no reason to accept Yaksha Challenge as water is a natural resource',
      image: AssetImage("images/pandava/story0.jpg"),
    ),
    Story(
      storyTitle:
          "Bhima didn't accept the Challenge and started a fight with him. At last Yaksha Killed Bhima.",
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story1.jpg"),
    ),
    Story(
      storyTitle:
          "Yaksha Killed Bhima as he started a fight with him. In search of Bhima, his brothers Arjuna, Nakula and Sahadeva went one by one and died by Yaksha as they didn't obey his words. At last Yudhistra went for searching his brothers. Yudhistira finds that while attempting to drink water from a lake, all his brothers have been killed by a mysterious Yaksha. When Yudhisthira arrives, the Yaksha challenges him to answer all his questions or else face the same consequences as his brothers. Yudhistra accepted and Yaksha promised that if he answers correctly, he will leave him with any of his dead brother revive. The questions are like Vedic sutras, short, pithy and practical, and deal with piety and religiosity. Yaksha raised his first question 'Who is really a helpful companion?'. Help Yudhistra to answer a question.",
      choice1: 'Wife, because she shares her life with his up and downs',
      choice2:
          'Steady intelligence is a very good friend, and can save one from all dangers.',
      image: AssetImage("images/pandava/story2.jpg"),
    ),
    Story(
      storyTitle:
          ' Wife is also a helpful companion, but sometimes even her actions may be wrong which can lead to adharma',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story3.jpg"),
    ),
    Story(
      storyTitle:
          'As Yudhistra answers the first question correctly, Yaksha proceeds with next question. Yaksha asked "How can one acquire something very great?".  Help Yudhistra to answer a question.',
      choice1: 'By the performance of austerity',
      choice2: 'By Adharma',
      image: AssetImage("images/pandava/story4.jpg"),
    ),
    Story(
      storyTitle:
          'Performance of austerity helps everyone to attain their rise and make them as a king with Dharma',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story5.jpg"),
    ),
    Story(
      storyTitle:
          'As Yudhistra answers the second question correctly, Yaksha proceeds with next question. Yaksha asked "Who is truly happy?".  Help Yudhistra to answer a question.',
      choice1: 'Person without depending on anyone for his well being.',
      choice2: 'Person with lots of money',
      image: AssetImage("images/pandava/story6.jpg"),
    ),
    Story(
      storyTitle:
          'Yudhistra said "One who cooks his own food (is not dependant on anyone), is not a debtor (does not spend more than he can afford), does not have to leave home to make in order to earn his livelihood (does not over endeavor for material things) is truly happy."',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story7.jpg"),
    ),
    Story(
      storyTitle:
          'As Yudhistra answered the question correctly, Yaksha proceeds with next question. Yaksha asked "What is the most wonderful thing?".  Help Yudhistra to answer a question.',
      choice1:
          'Thinks for his/her well being and earns money as if we live forever',
      choice2: 'Collect taxes and use it for personal gain',
      image: AssetImage("images/pandava/story8.jpg"),
    ),
    Story(
      storyTitle:
          'Yudhistra said "The most amazing thing is that even though every day one sees countless living entities dying, he still acts and thinks as if he will live forever."',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story9.jpg"),
    ),
    Story(
      storyTitle:
          'As Yudhistra answered the question correctly, Yaksha proceeds with next question. Yaksha asked "What is the real path to follow in this life?".  Help Yudhistra to answer a question.',
      choice1: 'To follow the path that helps to earn lot of money',
      choice2:
          'To follow the footsteps of the pure devotees who spent their life in dharma',
      image: AssetImage("images/pandava/story10.jpg"),
    ),
    Story(
      storyTitle:
          'Yudhistra said "The best path is to follow in the footsteps of the pure devotees, for they are the actual Mahajanas whose hearts are the sitting places of the real truths regarding religion."',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story11.jpg"),
    ),
    Story(
      storyTitle:
          'Yaksha was pleased by the answers of Yudhisthira . As Yaksha promised, he asked Yudhistra to choose anyone of his brother to revive. Help Yudhistra to handle the situation',
      choice1:
          'As bhima is the strongest of all his brothers, Yudhistra asked Yaksha to revive Bhima',
      choice2:
          'Yudhistra asked Yaksha to revive any one of the sons of Mata Madri ',
      image: AssetImage("images/pandava/story12.jpg"),
    ),
    Story(
      storyTitle:
          "Yudhishthira chose Nakula the son of Madri because he the son of Kunti was alive. In order to keep the scales of justice even he wanted to revive Madri's son Nakula. Thus Yudhishthira's impartiality pleased the Yaksha most. So Yaksha rewarded him by reviving his all dead brothers.",
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/pandava/story13.jpg"),
    ),
    Story(
      storyTitle:
          'Yaksha was pleased by the answers of Yudhisthira and the Yaksha who was none other than Dharmaraja (the father of Yudhisthira and the embodiment of religiosity) revives all the brothers of Yudhisthira and offers him many benedictions. As Yudhistra follows Dharma he revived his brothers back.',
      choice1: 'Restart',
      choice2: '',
      image: AssetImage("images/pandava/story14.jpg"),
    ),
  ];

  int _storyNumber = 0;

  Future<String> getStory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('pandava') == null) prefs.setInt(('pandava'), 0);
    _storyNumber = prefs.getInt('pandava') ?? 0;
    return _storyData[_storyNumber].storyTitle;
  }

  Future<double> getPercentage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('pandava') ?? 0;
    double percentage = ((_storyNumber + 1) / (_storyData.length));
    return percentage;
  }

  Future<AssetImage> getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('pandava') ?? 0;
    return _storyData[_storyNumber].image;
  }

  Future<String> getChoice1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('pandava') ?? 0;
    return _storyData[_storyNumber].choice1;
  }

  Future<String> getChoice2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('pandava') ?? 0;
    return _storyData[_storyNumber].choice2;
  }

  Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pandava', 0);
    // _storyNumber = 0;
  }

  void nextStory(int choiceNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (choiceNumber == 1 && _storyNumber == 0)
      prefs.setInt('pandava', 1);
    else if (choiceNumber == 2 && _storyNumber == 0) {
      prefs.setInt('pandava', 2);
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      prefs.setInt('pandava', 0);
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      prefs.setInt('pandava', 3);
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      prefs.setInt('pandava', 4);
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      prefs.setInt('pandava', 2);
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      prefs.setInt('pandava', 6);
    } else if (choiceNumber == 2 && _storyNumber == 4) {
      prefs.setInt('pandava', 5);
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      prefs.setInt('pandava', 4);
    } else if (choiceNumber == 1 && _storyNumber == 6) {
      prefs.setInt('pandava', 8);
    } else if (choiceNumber == 2 && _storyNumber == 6) {
      prefs.setInt('pandava', 7);
    } else if (choiceNumber == 1 && _storyNumber == 7) {
      prefs.setInt('pandava', 6);
    } else if (choiceNumber == 1 && _storyNumber == 8) {
      prefs.setInt('pandava', 10);
    } else if (choiceNumber == 2 && _storyNumber == 8) {
      prefs.setInt('pandava', 9);
    } else if (choiceNumber == 1 && _storyNumber == 9) {
      prefs.setInt('pandava', 8);
    } else if (choiceNumber == 1 && _storyNumber == 10) {
      prefs.setInt('pandava', 11);
    } else if (choiceNumber == 2 && _storyNumber == 10) {
      prefs.setInt('pandava', 12);
    } else if (choiceNumber == 1 && _storyNumber == 11) {
      prefs.setInt('pandava', 10);
    } else if (choiceNumber == 1 && _storyNumber == 12) {
      prefs.setInt('pandava', 13);
    } else if (choiceNumber == 2 && _storyNumber == 12) {
      prefs.setInt('pandava', 14);
    } else if (choiceNumber == 1 && _storyNumber == 13) {
      prefs.setInt('pandava', 12);
    } else if (choiceNumber == 1 && _storyNumber == 14) {
      await reset();
    }
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 1 ||
        _storyNumber == 3 ||
        _storyNumber == 5 ||
        _storyNumber == 7 ||
        _storyNumber == 9 ||
        _storyNumber == 13 ||
        _storyNumber == 14 ||
        _storyNumber == 11)
      return false;
    else
      return true;
  }
}
