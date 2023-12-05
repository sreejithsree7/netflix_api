import 'package:flutter/material.dart';
import 'package:netflixapi/core/constant.dart';
import 'package:netflixapi/presentation/downloads/screen_downloads.dart';

import '../../../controler/api.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of movies and shows for you, so there is always something to watch on your device",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kHeight,
        FutureBuilder<List<String>>(
          future: Api().getDownloadImageUrls(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            } else {
              return SizedBox(
                height: size.width,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: size.width * 0.4,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    DownlodsImageWidgets(
                        imageList: snapshot.data![0],
                        margin: EdgeInsets.only(left: 170, top: 50),
                        angle: 25,
                        size: Size(
                          size.width * 0.35,
                          size.width * 0.55,
                        )),
                    DownlodsImageWidgets(
                        imageList: snapshot.data![1],
                        margin: EdgeInsets.only(right: 170, top: 50),
                        angle: -20,
                        size: Size(size.width * 0.35, size.width * 0.55)),
                    DownlodsImageWidgets(
                        imageList: snapshot.data![2],
                        radius: 8,
                        margin: EdgeInsets.only(bottom: 35, top: 50),
                        size: Size(size.width * 0.4, size.width * 0.6))
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
