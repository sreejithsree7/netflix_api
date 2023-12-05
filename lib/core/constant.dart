import 'package:flutter/material.dart';

import '../model/model.dart';

const kwidth = SizedBox(
  width: 10,
);
const kHeight = SizedBox(
  height: 10,
);
const kHeight20 = SizedBox(
  height: 20,
);
const kHeight50 = SizedBox(
  height: 50,
);

const kHeight30 = SizedBox(height: 30);

TextStyle homeTitleTextStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

/// BorderRadius

BorderRadius kRadius10 = BorderRadius.circular(10);
final BorderRadius kRadius30 = BorderRadius.circular(30);
BorderRadius kRadius20 = BorderRadius.circular(20);

// Image
const imagePath = 'https://image.tmdb.org/t/p/w500';

const kMainImage =
    "https://www.themoviedb.org/t/p/w440_and_h660_face/kwB7d51AIcyzPOBOHLCEZJkmPhQ.jpg";

// TextStyle
TextStyle kHomeTitleText =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

const newAndHotTempImage =
    "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/8rpDcsfLJypbO6vREc0547VKqEv.jpg";
const newAndHotTempImage2 =
    "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/iKUwhA4DUxMcNKu5lLSbDFwwilk.jpg";

//////

ValueNotifier<List<Movie>> trendingNowListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> topRatedListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> top10TvShowsInIndiaTodayListNotifeir =
    ValueNotifier([]);
ValueNotifier<List<Movie>> upComingListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> searchResultListNotifeir = ValueNotifier([]);
