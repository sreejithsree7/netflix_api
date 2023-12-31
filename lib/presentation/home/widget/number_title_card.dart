



import 'package:flutter/cupertino.dart';
import 'package:netflixapi/core/constant.dart';

import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 TV Shows In India Today"),
        kHeight,
        LimitedBox(
            maxHeight: 250,
            child: ValueListenableBuilder(
                valueListenable: top10TvShowsInIndiaTodayListNotifeir,
                builder: (context, value, _) {
                  return ListView.builder(
                      itemCount: top10TvShowsInIndiaTodayListNotifeir
                              .value.isNotEmpty
                          ? 10
                          : top10TvShowsInIndiaTodayListNotifeir.value.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = value[index];
                        return MainNumberCardHome(index: index, movie: data);
                      });
                }))
      ],
    );
  }
}