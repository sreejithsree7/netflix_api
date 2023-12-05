




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/constant.dart';
import 'package:netflixapi/presentation/search/widget/title.dart';

import '../../../controler/api.dart';
import '../../../model/model.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SearchTextWidget(text: "Top Searches"),
        kHeight,
        Expanded(
          child: FutureBuilder(
            future: Api().forSearchDara(),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return TopSearchItemTile(
                        movie: data,
                      );
                    },
                    separatorBuilder: (context, index) => kHeight,
                    itemCount: snapshot.data!.length);
              }
            },
          ),
        ),
      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              height: 100,
              width: 170,
              child: Image.network(
                "$imagePath${movie.backDropPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          kwidth,
          Expanded(
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(
            CupertinoIcons.play_circle,
            color: Colors.white,
            size: 40,
          ),
          kwidth
        ],
      ),
    );
  }
}