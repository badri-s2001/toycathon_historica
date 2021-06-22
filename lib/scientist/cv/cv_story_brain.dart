import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import '../../story.dart';

class CVStoryBrain {
  List<Story> _storyData = [
    Story(
      storyTitle:
          'Sir C.V raman was one of eight siblings.His own proficiency in physics was recognised early on Due to his fathers interest, he was asked to appeared for the Financial Civil Services (FCS). Help raman to make a decision',
      choice1:
          'Dont consider fathers opinions and start pursuing your own career in physics',
      choice2:
          'Appear in FCS, Clear the exam and continue research during spare time',
      image: AssetImage("images/cv/story0.jpg"),
    ),
    Story(
      storyTitle:
          'Raman was very passionate about researches in physics but had lost the support of the family,since he failed to abide by his fathers interests',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/cv/story1.jpg"),
    ),
    Story(
      storyTitle:
          'He appeared for the Financial Civil Services (FCS) examination and topped it.He went to Calcutta (now Kolkata) and joined as Assistant Accountant General. But in the spare time, he went to the laboratory for doing research at the Indian Association for Cultivation of Sciences. Even though he had health issues he was a chance to pursue career in england ',
      choice1: 'To stay in india as a researcher',
      choice2: 'To Travel to england',
      image: AssetImage("images/cv/story2.jpg"),
    ),
    Story(
      storyTitle:
          'C.V raman was a renowned physician and had done many researches at the Indian Association for Cultivation of Sciences and was a accountant in FCS ',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/cv/story3.jpg"),
    ),
    Story(
      storyTitle:
          'Although deferred, Raman did make a trip to England, where he was elected as a fellow of the Royal Society and knighted by the British.He published his work on the "Molecular Diffraction of Light" in 1922 which led to his ultimate discovery of the radiation effect and gained him to decide whether to receive Nobel Prize in Physics',
      choice1: 'Accept the Nobel prize in physics',
      choice2: ' Deny the honourable prize',
      image: AssetImage("images/cv/story4.jpg"),
    ),
    Story(
      storyTitle:
          'Denied the noble prize in physics .He continued to be a scientist and a professor',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/cv/story5.jpg"),
    ),
    Story(
      storyTitle:
          'Having Accepted the nobel prize in physics for his molecular diffraction of light he became the very He became the first Indian to receive a Nobel Prize. Now he had to decide?',
      choice1: 'Return back to india to join in Indian Institute of science',
      choice2: 'Continue his researches in england ',
      image: AssetImage("images/cv/story6.jpg"),
    ),
    Story(
      storyTitle:
          'C.V.raman becomes one of the most important person in the field of physics in england by publishing more of his works on international journals in England',
      choice1: 'Go back to previous choice',
      choice2: '',
      image: AssetImage("images/cv/story7.jpg"),
    ),
    Story(
      storyTitle:
          'He returned to India and joined the Indian Institute of Science in Bangalore as its first Indian director in 1933, and founded the Indian Academy of Sciences in 1934, also publishing the academy’s proceedings. He was appointed the first National Professor by the new government following India’s independence in 1947 and founded the Raman Research Institute in Bangalore',
      choice1: 'Restart',
      choice2: '',
      image: AssetImage("images/cv/story8.jpg"),
    ),
  ];

  int _storyNumber = 0;

  Future<String> getStory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('cv') == null) prefs.setInt(('cv'), 0);
    _storyNumber = prefs.getInt('cv') ?? 0;
    return _storyData[_storyNumber].storyTitle;
  }

  Future<double> getPercentage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('cv') ?? 0;
    double percentage = ((_storyNumber + 1) / (_storyData.length));
    return percentage;
  }

  Future<AssetImage> getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('cv') ?? 0;
    return _storyData[_storyNumber].image;
  }

  Future<String> getChoice1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('cv') ?? 0;
    return _storyData[_storyNumber].choice1;
  }

  Future<String> getChoice2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storyNumber = prefs.getInt('cv') ?? 0;
    return _storyData[_storyNumber].choice2;
  }

  Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cv', 0);
    // _storyNumber = 0;
  }

  void nextStory(int choiceNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (choiceNumber == 1 && _storyNumber == 0) {
      prefs.setInt('cv', 1);
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      prefs.setInt('cv', 2);
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      prefs.setInt('cv', 0);
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      prefs.setInt('cv', 3);
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      prefs.setInt('cv', 4);
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      prefs.setInt('cv', 2);
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      prefs.setInt('cv', 6);
    } else if (choiceNumber == 2 && _storyNumber == 4) {
      prefs.setInt('cv', 5);
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      prefs.setInt('cv', 4);
    } else if (choiceNumber == 2 && _storyNumber == 6) {
      prefs.setInt('cv', 7);
    } else if (choiceNumber == 1 && _storyNumber == 6) {
      prefs.setInt('cv', 8);
    } else if (choiceNumber == 1 && _storyNumber == 7) {
      prefs.setInt('cv', 6);
    } else if (choiceNumber == 1 && _storyNumber == 8) {
      await reset();
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
