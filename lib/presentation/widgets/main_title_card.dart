

import 'package:flutter/cupertino.dart';
import 'package:netflixapi/core/constant.dart';

import '../../model/model.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard(
      {super.key, required this.title, required this.listNotifier});
  final String title;
  final ValueNotifier<List<Movie>> listNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
            maxHeight: 250,
            child: ValueListenableBuilder(
                valueListenable: listNotifier,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = value[index];
                      return MainCardHome(
                        movie: data,
                      );
                    },
                  );
                }))
      ],
    );
  }
}