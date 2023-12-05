

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapi/core/constant.dart';
import 'package:netflixapi/presentation/search/widget/title.dart';

import '../../../controler/api.dart';
import '../../../model/model.dart';
import '../../widgets/main_card.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextWidget(text: "Movies & TV"),
        kHeight,
        Expanded(
          child: FutureBuilder<List<Movie>>(
            future: Api().searchResult(result),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error loading data"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) {
                    var data = snapshot.data![index];
                    return MainCardHome(
                      movie: data,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}