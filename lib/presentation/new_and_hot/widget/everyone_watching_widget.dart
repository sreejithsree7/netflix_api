

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/constant.dart';

import '../../../core/colors/colors.dart';
import '../../../model/model.dart';
import '../../home/widget/custom_buttan_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movie.title,
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          movie.overview,
          style:const TextStyle(color: kGreyColor, fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        kHeight30,
        VideoWidget(image: movie.posterPath),
        kHeight,
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth
          ],
        ),
        kHeight30
      ],
    );
  }
}