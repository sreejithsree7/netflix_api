

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixapi/core/constant.dart';

import '../../../core/colors/colors.dart';
import '../../../model/model.dart';
import '../../home/widget/custom_buttan_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  final DateFormat monthFormatter = DateFormat('MMM');
  final DateFormat dayFormatter = DateFormat('dd');
  final DateFormat dayFormatterDay = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 430,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                monthFormatter
                    .format(DateTime.parse(movie.releaseDate))
                    .toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    color: kGreyColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dayFormatter.format(DateTime.parse(movie.releaseDate)),
                style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: movie.posterPath),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width - 170,
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -5),
                    ),
                  ),
                  Row(
                    children: [
                      CustomButton(
                        icon: Icons.notifications_none,
                        title: "Remind Me",
                        iconSize: 25,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButton(
                        icon: Icons.info,
                        title: "info",
                        iconSize: 25,
                        textSize: 12,
                      ),
                      kwidth
                    ],
                  ),
                ],
              ),
              kHeight,
              Text(
                  "Coming On ${dayFormatterDay.format(DateTime.parse(movie.releaseDate))}"),
              kHeight,
              Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight,
              Text(
                movie.overview,
                style: const TextStyle(color: kGreyColor),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        )
      ],
    );
  }
}
