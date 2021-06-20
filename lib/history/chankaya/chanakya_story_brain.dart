import 'package:flutter/material.dart';

import '../../story.dart';

class ChanakyaStoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
          'Rishi Canak notices that his son Chanakya is a prodigy, help him make a decision.',
      choice1: 'Send him to teach at Takshashila',
      choice2: 'School him at home',
      image: AssetImage("images/chanakya/story0.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya asks that his father send him to school in Takshashila',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/chanakya/story1.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya studies economics and the vedas in Takshashila. He is a top student and is offered a job there as a teacher. Help chanakya make a decision.',
      choice1: 'Accept the job',
      choice2: 'Deny the job.',
      image: AssetImage("images/chanakya/story2.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya returns home and writes many books and leads a quiet life',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/chanakya/story3.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya becomes one of the top teachers at Takshashila. One day Chanakya goes to Pataliputra for a yajna that is to be performed by king Dhanananda. As Chanakya sits down for the Brahmabhoj, king Dhanananda insults chanakya calling him ugly and tells him to leave. What would chanakya do?',
      choice1: 'Leave and never return to Pataliputra',
      choice2: 'Vow revenge on King Dhanananda',
      image: AssetImage("images/chanakya/story4.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya goes back to Takshashila and leads a peaceful life.',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/chanakya/story5.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya collects a huge amount of money and hides it in the forest, what should he do next?',
      choice1: 'Abandon his pursuit of revenge.',
      choice2:
          'Set out to find a protege to train and overthrow kind Dhanananda',
      image: AssetImage("images/chanakya/story6.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya goes back to Takshashila and leads a peaceful life.',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/chanakya/story7.jpg"),
    ),
    Story(
      storyTitle:
          "Chanakya finds a boy named Chandragupta Maurya and decides to make him his protege but he is also considering king Dhanananda's son Pabbata. How should he choose between the two? ",
      choice1: 'Devise a test to choose between the two.',
      choice2: 'Select Pabbata because he is closer to the king',
      image: AssetImage("images/chanakya/story8.jpg"),
    ),
    Story(
      storyTitle:
          'Pabbata proves to be weak and fails to overthrow his father.',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/chanakya/story9.png"),
    ),
    Story(
      storyTitle:
          'Pabbata fails the test and Chandragupta Maurya passes. Chanakya uses his money to build an army and teach Chandragupta Maurya how to be a wise ruler and warrior. Chandragupta Maurya overthrows king Dhanananda and becomes ruler. What should Chanakya do next?',
      choice1:
          'Become a royal advisor and author books that could help posterity',
      choice2: 'Go back to teaching in Takshashila now that he has his revenge',
      image: AssetImage("images/chanakya/story10.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya goes back to Takshashila and leads a peaceful life.',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/chanakya/story11.jpg"),
    ),
    Story(
      storyTitle:
          'Chanakya writes Chanakya Neeti and Arthashastra whilst helping Chandragupta Maurya run the kingdom efficiently',
      choice1: 'Restart',
      choice2: '',
      image: AssetImage("images/chanakya/story12.jpeg"),
    ),
  ];

  int _storyNumber = 0;

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  AssetImage getImage() {
    return _storyData[_storyNumber].image;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void reset() {
    _storyNumber = 0;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0)
      _storyNumber = 2;
    else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 0;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      _storyNumber = 2;
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 4) {
      _storyNumber = 6;
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      _storyNumber = 4;
    } else if (choiceNumber == 2 && _storyNumber == 6) {
      _storyNumber = 8;
    } else if (choiceNumber == 1 && _storyNumber == 6) {
      _storyNumber = 7;
    } else if (choiceNumber == 1 && _storyNumber == 7) {
      _storyNumber = 6;
    } else if (choiceNumber == 1 && _storyNumber == 8) {
      _storyNumber = 10;
    } else if (choiceNumber == 2 && _storyNumber == 8) {
      _storyNumber = 9;
    } else if (choiceNumber == 1 && _storyNumber == 9) {
      _storyNumber = 8;
    } else if (choiceNumber == 1 && _storyNumber == 10) {
      _storyNumber = 12;
    } else if (choiceNumber == 2 && _storyNumber == 10) {
      _storyNumber = 11;
    } else if (choiceNumber == 1 && _storyNumber == 11) {
      _storyNumber = 10;
    } else if (choiceNumber == 1 && _storyNumber == 12) {
      reset();
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
