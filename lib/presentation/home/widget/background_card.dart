

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/presentation/home/widget/custom_buttan_widget.dart';

import '../../../core/constant.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagePath + image), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: -10,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButton(icon: Icons.add, title: "My List"),
              _playButton(),
              const CustomButton(icon: Icons.info, title: "Info"),
            ],
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(KWhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        color: KblackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 20, color: KblackColor),
        ),
      ));
}
