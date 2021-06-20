import 'package:flutter/material.dart';

import '../../story.dart';

class APJStoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
          'Abdul kalam wanted to become a fighter pilot. He was working hard but his dream could not be fulfilled as there were only eight positions available in the IAF and he secured the ninth place.  Help abdul kalam by making a decision',
      choice1:
          'Dont Give up on dream to become a fighter pilot and try retaking the IAF Exam.',
      choice2:
          'Follow the inspiration and pursue career as scientist in Aeronautical Development Establishment.',
      image: AssetImage("images/apj/story0.jpg"),
    ),
    Story(
      storyTitle:
          'Abdul was passionate about retaking the exam and became a fighter pilot and retired as a fighter pilot',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/apj/story1.jpg"),
    ),
    Story(
      storyTitle:
          'Abdul kalam was a great scientist and became a recognized even at international level.Help Abdul in making a decision',
      choice1: 'To Join in NASA',
      choice2: 'To join in ISRO',
      image: AssetImage("images/apj/story2.jpg"),
    ),
    Story(
      storyTitle:
          'Abdul kalam became the number one scientist and was respected in america and did not return to india due to multiple projects in NASA',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/apj/story3.jpg"),
    ),
    Story(
      storyTitle:
          'After joining ISRO Abdul kalam has helped with numerous projects. Abdul kalam has been offered the role of president of India by Vajpayee help him make a decision ',
      choice1: 'Accept the role as president of India',
      choice2: ' Deny the role',
      image: AssetImage("images/apj/story4.jpg"),
    ),
    Story(
      storyTitle:
          'Denied the role of President.He continued to be a scientist and a professor',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/apj/story5.jpg"),
    ),
    Story(
      storyTitle:
          'Having Accepted the role of the president,Abdul kalam helps India to become a strong military force, he tours the country to get to understand the problems the nation faced and help build the nation. After completing the first term of his presidency successfully what should he do?',
      choice1: 'Resume his life as a teacher',
      choice2: 'Run for a second term ',
      image: AssetImage("images/apj/story6.jpg"),
    ),
    Story(
      storyTitle:
          'Abdul becomes president for a second term and continues serving the people of India as "peoples president" hoping to achieve VISION 2020 by any means',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/apj/story7.jpg"),
    ),
    Story(
      storyTitle:
          'He resumes his role as professor and a Guest lecturer and tours the country in search of young minds and imparting wisdom all over India',
      choice1: 'Restart',
      choice2: '',
      image: AssetImage("images/apj/story8.jpg"),
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
      _storyNumber = 0;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 3;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      _storyNumber = 2;
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      _storyNumber = 6;
    } else if (choiceNumber == 2 && _storyNumber == 4) {
      _storyNumber = 5;
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      _storyNumber = 4;
    } else if (choiceNumber == 2 && _storyNumber == 6) {
      _storyNumber = 7;
    } else if (choiceNumber == 1 && _storyNumber == 6) {
      _storyNumber = 8;
    } else if (choiceNumber == 1 && _storyNumber == 7) {
      _storyNumber = 6;
    } else if (choiceNumber == 1 && _storyNumber == 8) {
      reset();
    }
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 1 ||
        _storyNumber == 3 ||
        _storyNumber == 5 ||
        _storyNumber == 7 ||
        _storyNumber == 8)
      return false;
    else
      return true;
  }
}
