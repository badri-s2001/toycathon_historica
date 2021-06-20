import 'package:flutter/cupertino.dart';

import '../../story.dart';

class AshokaStoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
          'There is a rebellion happening in Takshashila that needs to be stopped. Help King Bindusara make a decision.',
      choice1: 'Send prince Ashoka to suppress the rebellion.',
      choice2: 'Let prince Ashoka continue governing Ujjain.',
      image: AssetImage("images/ashoka/story0.jpg"),
    ),
    Story(
      storyTitle:
          'The rebellion is suppressed. Very soon a second rebellion arises and King Bindusara\'s eldest son Prince Susima fails to curb the rebellion. Help King Bindusara make a decision.',
      choice1: 'Send prince Ashoka to suppress the rebellion once again.',
      choice2: 'Let Susima handle the rebellion.',
      image: AssetImage("images/ashoka/story1.jpg"),
    ),
    Story(
      storyTitle:
          'The rebellion overthrows King Bindusara\'s rule in Takshashila',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/ashoka/story2.jpg"),
    ),
    Story(
      storyTitle:
          'Prince Ashoka is ill and cannot go to Takshashila, help Prince Ashoka make a decision.',
      choice1:
          'Wait until bedridden King Bindusara passes away and seize the throne.',
      choice2: 'Let Prince Susima handle the rebellion.',
      image: AssetImage("images/ashoka/story3.jpg"),
    ),
    Story(
      storyTitle:
          'The rebellion overthrows King Bindusara\'s rule in Takshashila',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/ashoka/story4.jpeg"),
    ),
    Story(
      storyTitle:
          'Ashoka\'s elder brother upon returning from Takshashila is enraged on finding out that Ashoka has made himself king. Help King Ashoka make a decision.',
      choice1: 'Wage war against your brothers',
      choice2: 'Give your brother the throne as he is the rightful heir.',
      image: AssetImage("images/ashoka/story5.jpg"),
    ),
    Story(
      storyTitle:
          'After defeating his brothers Ashoka is crowned king of his father\'s empire. After coming to the throne, he found himself the all-powerful ruler of a great empire. Help Ashoka decide what he should do next. ',
      choice1:
          'Tax the citizens and use the money to develop the kingdom and create more trade routes',
      choice2: 'Collect taxes and use it for personal gain',
      image: AssetImage("images/ashoka/story6.jpg"),
    ),
    Story(
      storyTitle:
          'Susima is made king and Ashoka continues to be the viceroy in Ujjain',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/ashoka/story7.jpg"),
    ),
    Story(
      storyTitle:
          'Ashoka has now set his eyes set on the adjacent land of Kalinga. What should Ashoka do?',
      choice1: 'Invade Kalinga',
      choice2: 'Try to form diplomatic relations with the ruler of Kalinga.',
      image: AssetImage("images/ashoka/story8.png"),
    ),
    Story(
      storyTitle:
          'Ashoka invades Kalinga and wreaks havoc killing thousands. The destruction caused during the war made him repent violence. What should ashoka do now?',
      choice1: 'Explore buddha\'s teachings to find some inner peace',
      choice2: 'Continue his conquest and capture more kingdoms.',
      image: AssetImage("images/ashoka/story9.jpeg"),
    ),
    Story(
      storyTitle:
          'Ashoka forms diplomatic relations with the ruler of Kalinga and rules peacefully',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/ashoka/story10.jpg"),
    ),
    Story(
      storyTitle:
          'Ashoka converts to Buddhism and finds inner peace in Buddha\'s teachings. He then helped in spreading Buddhism both throughout India and abroad',
      choice1: 'Restart',
      choice2: '',
      image: AssetImage("images/ashoka/story11.jpg"),
    ),
    Story(
      storyTitle:
          'Ashoka wins several conquests but is left feeling more desolate with each victory',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/ashoka/story12.jpg"),
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
      _storyNumber = 1;
    else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 0;
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 3) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      _storyNumber = 6;
    } else if (choiceNumber == 2 && _storyNumber == 5) {
      _storyNumber = 7;
    } else if (choiceNumber == 1 && _storyNumber == 6) {
      _storyNumber = 8;
    } else if (choiceNumber == 2 && _storyNumber == 6) {
      _storyNumber = 8;
    } else if (choiceNumber == 1 && _storyNumber == 7) {
      _storyNumber = 5;
    } else if (choiceNumber == 1 && _storyNumber == 8) {
      _storyNumber = 9;
    } else if (choiceNumber == 2 && _storyNumber == 8) {
      _storyNumber = 10;
    } else if (choiceNumber == 1 && _storyNumber == 9) {
      _storyNumber = 11;
    } else if (choiceNumber == 2 && _storyNumber == 9) {
      _storyNumber = 12;
    } else if (choiceNumber == 1 && _storyNumber == 10) {
      _storyNumber = 8;
    } else if (choiceNumber == 1 && _storyNumber == 11) {
      reset();
    } else if (choiceNumber == 1 && _storyNumber == 12) {
      _storyNumber = 9;
    }
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 2 ||
        _storyNumber == 4 ||
        _storyNumber == 7 ||
        _storyNumber == 10 ||
        _storyNumber == 12 ||
        _storyNumber == 11)
      return false;
    else
      return true;
  }
}
