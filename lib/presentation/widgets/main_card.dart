


import 'package:flutter/cupertino.dart';

import '../../core/constant.dart';
import '../../model/model.dart';

class MainCardHome extends StatelessWidget {
  const MainCardHome({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            image: DecorationImage(
                image: NetworkImage("$imagePath${movie.posterPath}"),
                fit: BoxFit.cover)),
      ),
    );
  }
}