import 'package:flutter/material.dart';

class TextImageCard extends StatelessWidget {
  final String text;
  final String percentage;
  final DecorationImage image;
  final Color color;
  final double height;
  final void Function() onTap;

  TextImageCard({
    required this.text,
    required this.percentage,
    required this.image,
    required this.color,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 8.0,
      ),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          elevation: 15.0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: image,
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                width: double.infinity,
                height: height,
              ),
              Opacity(
                opacity: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: color,
                  ),
                  height: height,
                  width: double.infinity,
                ),
              ),
              Container(
                height: height,
                alignment: Alignment.centerLeft,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(20)),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                      Text(
                        percentage,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
