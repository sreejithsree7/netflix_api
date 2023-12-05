import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapi/presentation/home/widget/number_title_card.dart';

import '../../controler/api.dart';
import '../../core/constant.dart';
import '../widgets/main_title_card.dart';
import 'widget/background_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
int randomIndex = 0;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  fetchDatas() async {
    trendingNowListNotifeir.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    top10TvShowsInIndiaTodayListNotifeir.value =
        await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, value, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection scrollDirection = notification.direction;
                if (scrollDirection == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (scrollDirection == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      FutureBuilder(
                        future: Api().getTrendingMovies(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? BackgroundCard(
                                image: snapshot.data![randomIndex].posterPath)
                            : const SizedBox(
                                height: 700,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "Top Rated",
                        listNotifier: topRatedListNotifeir,
                      ),
                      MainTitleCard(
                        title: "Trending now",
                        listNotifier: trendingNowListNotifeir,
                      ),
                      const NumberTitleCard(),
                      MainTitleCard(
                        title: "Upcoming",
                        listNotifier: upComingListNotifeir,
                      )
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          color: Colors.black.withOpacity(0.2),
                          height: 90,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456",
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  kwidth,
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  kwidth
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows",
                                    style: homeTitleTextStyle,
                                  ),
                                  Text(
                                    "Movies",
                                    style: homeTitleTextStyle,
                                  ),
                                  Text(
                                    "Categories",
                                    style: homeTitleTextStyle,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight
                ],
              ),
            );
          }),
    );
  }
}
