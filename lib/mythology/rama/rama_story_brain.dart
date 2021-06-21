import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import '../../story.dart';

class RamaStoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
          'King Dasharatha has four sons Rama, Bharatha, Lakshmana and Shatrughan and has three wives Kausalya, Kaikeyi and Sumitra . One day, sage Vishwamitra arrived and asked King Dasharatha to send Rama and Lakshmana as "lent" to help him to rid his hermitage from the demons. Help King Dasharatha to make a decision.',
      choice1: 'Help Vishwamitra by sending his sons.',
      choice2:
          'Let Dasharatha fails to send his sons,as he has too much love on his sons',
      image: AssetImage("images/rama/story0.jpg"),
    ),
    Story(
      storyTitle:
          'Dasharatha as a King should follow his dharma, without thinking about his welfare',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/rama/story1.jpg"),
    ),
    Story(
      storyTitle:
          "Rama kills demons and weds 'Sita' by winning swayamvar in Mithili. Later Dasharatha decided that it was time for Rama to become king. But his youngest queen invoked an old promise that Dasharatha had made to her: she demanded that Rama be exiled for 14 years and that her own son, Bharat, be crowned king. Help King Dasharatha to make a decision.",
      choice1: 'To accept the demand as he promised for Kaikeyi',
      choice2:
          'Let Dasharatha rejects her demand,as he has too much love on his son Rama',
      image: AssetImage("images/rama/story2.jpg"),
    ),
    Story(
      storyTitle:
          "Dasharatha as a King should follow his dharma, without thinking about his welfare",
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/rama/story3.jpg"),
    ),
    Story(
      storyTitle:
          "Ram accepts her mom Kaikeyi's demand and went to forest. Dasharatha dies soon after. After hearing this, what will Rama decide?. Help him.  ",
      choice1: 'Return back to kingdom and take part in his dad funeral',
      choice2: 'To be in forest',
      image: AssetImage("images/rama/story4.jpg"),
    ),
    Story(
      storyTitle:
          "Rama refused to return, stating his intention to serve his father's last wish by being an exile for the full 14 years. ",
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/rama/story5.jpg"),
    ),
    Story(
      storyTitle:
          "Bharat returned with Rama's sandals, placed them on the throne, and proceeded to rule the country in Rama's name. Rama, Lakshmana and Sita moved further deep of south. A she-demon Soorpanakha met Rama and Lakshmana and asked them to marry. They refused with the play 'ping pong'. She got angry and came to attack Sita. Help them to protect Sita with a decision ",
      choice1: 'Make her to attack Sita',
      choice2: 'To protect Sita and punish Soorpanakha',
      image: AssetImage("images/rama/story6.jpg"),
    ),
    Story(
      storyTitle:
          "Lakshmana punished Soorpanakha, as it is the duty of him to protect the wife of an elder brother.",
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/rama/story7.jpg"),
    ),
    Story(
      storyTitle:
          "Lakshmana cut off Surpanakha's nose and ears.Surpanakha flew towards Lanka (modern Sri Lanka), ruled by her brother Ravana, and complained.Enraged, Ravana vowed vengeance. He persuaded the demon Marich to disguise himself as a golden deer and wander near Rama's hut. When Sita saw the golden deer, she begged Rama to get it for her. When the brothers were out pursuing the deer, Ravana arrived, abducted Sita, placed her in his flying chariot, and flew through the skies to Lanka. When the princes, after having killed the golden deer and discovered it was a demon in disguise, returned to their hut, they found it empty. Help Rama to handle this situation ",
      choice1: 'To ask help with others to find Sita',
      choice2: "To search a girl at Sita's position",
      image: AssetImage("images/rama/story8.jpg"),
    ),
    Story(
      storyTitle:
          "At that time, multiple wives are allowed for a king, but Rama was loyal to Sita and he didn't even see other women with that mind.",
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/rama/story9.jpg"),
    ),
    Story(
      storyTitle:
          "Rama and Lakshmana set out in search of Sita. Jatayu told them that Sita had been abducted by Ravana. Rama met Sugriva. Sugriva agrees to help Rama only if he kills his brother Vali. Vali drove Sugriva out of the kingdom and enslaved his wife. Help Rama to take a decision. ",
      choice1: 'Agrees and kill Vali',
      choice2: 'Let him face his own problem and move away',
      image: AssetImage("images/rama/story10.jpg"),
    ),
    Story(
      storyTitle: 'Rama is a honest, helping person and also follows dharma.',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/rama/story11.jpg"),
    ),
    Story(
      storyTitle:
          "Rama kills Vali. As promise Sugriva helps Rama along with army and Hanuman. Among them Hanuman, who ultimately located Sita's whereabouts to be in Ravana's kingdom in Lanka. Rama gained the help of the chief Sugriva, gathered a monkey army, marched southwards, built a bridge across the ocean and crossed over to Lanka. Rama, after an epic battle, was then able to kill Ravana and finally free Sita.",
      choice1: 'Restart',
      choice2: '',
      image: AssetImage("images/rama/story12.jpg"),
    ),
  ];

  int _storyNumber = 0;

  Future<String> getStory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('rama') ?? 0;
    return _storyData[_storyNumber].storyTitle;
  }

  Future<double> getPercentage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('rama') ?? 0;
    double percentage = ((_storyNumber + 1) / (_storyData.length));
    return percentage;
  }

  Future<AssetImage> getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('rama') ?? 0;
    return _storyData[_storyNumber].image;
  }

  Future<String> getChoice1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('rama') ?? 0;
    return _storyData[_storyNumber].choice1;
  }

  Future<String> getChoice2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('rama') ?? 0;
    return _storyData[_storyNumber].choice2;
  }

  Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('rama', 0);
    // _storyNumber = 0;
  }

  void nextStory(int choiceNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (choiceNumber == 1 && _storyNumber == 0)
      prefs.setInt('rama', 2);
    else if (choiceNumber == 2 && _storyNumber == 0) {
      prefs.setInt('rama', 1);
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      prefs.setInt('rama', 0);
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      prefs.setInt('rama', 4);
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      prefs.setInt('rama', 3);
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      prefs.setInt('rama', 2);
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      prefs.setInt('rama', 5);
    } else if (choiceNumber == 2 && _storyNumber == 4) {
      prefs.setInt('rama', 6);
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      prefs.setInt('rama', 4);
    } else if (choiceNumber == 2 && _storyNumber == 6) {
      prefs.setInt('rama', 8);
    } else if (choiceNumber == 1 && _storyNumber == 6) {
      prefs.setInt('rama', 7);
    } else if (choiceNumber == 1 && _storyNumber == 7) {
      prefs.setInt('rama', 6);
    } else if (choiceNumber == 1 && _storyNumber == 8) {
      prefs.setInt('rama', 10);
    } else if (choiceNumber == 2 && _storyNumber == 8) {
      prefs.setInt('rama', 9);
    } else if (choiceNumber == 1 && _storyNumber == 9) {
      prefs.setInt('rama', 8);
    } else if (choiceNumber == 1 && _storyNumber == 10) {
      prefs.setInt('rama', 12);
    } else if (choiceNumber == 2 && _storyNumber == 10) {
      prefs.setInt('rama', 11);
    } else if (choiceNumber == 1 && _storyNumber == 11) {
      prefs.setInt('rama', 10);
    } else if (choiceNumber == 1 && _storyNumber == 12) {
      await reset();
    }
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 1 ||
        _storyNumber == 3 ||
        _storyNumber == 5 ||
        _storyNumber == 7 ||
        _storyNumber == 9 ||
        _storyNumber == 12 ||
        _storyNumber == 11)
      return false;
    else
      return true;
  }
}
