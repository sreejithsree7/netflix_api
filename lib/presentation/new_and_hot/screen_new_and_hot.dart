import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/constant.dart';

import 'widget/coming_soon_widget.dart';
import 'widget/everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 35,
              ),
              kwidth,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 35,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                            fit: BoxFit.cover,
                            scale: 1)),
                  ),
                ],
              ),
              kwidth
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: KWhiteColor,
                labelColor: KblackColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: KWhiteColor, borderRadius: kRadius20),
                tabs: const [
                  Tab(
                    text: "🍿 Coming soon",
                  ),
                  Tab(
                    text: "👀 Everyone's watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ValueListenableBuilder(
        valueListenable: upComingListNotifeir,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              var data = value[index];
              return ComingSoonWidget(
                movie: data,
              );
            },
          );
        });
  }

  Widget _buildEveryonesWatching() {
    return ValueListenableBuilder(
        valueListenable: topRatedListNotifeir,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              var data = value[index];
              return EveryonesWatchingWidget(
                movie: data,
              );
            },
          );
        });
  }
}
