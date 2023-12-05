// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/core/constant.dart';
import 'package:netflixapi/presentation/widgets/app_bar_widget.dart';

import 'widgets/section2.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [const _SmartDownloads(), Section2(), Section3()];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}



class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: KbuttonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Set up",
                style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: KbuttonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "See what you can download",
              style: TextStyle(
                  color: KblackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: KWhiteColor,
        ),
        kwidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownlodsImageWidgets extends StatelessWidget {
  const DownlodsImageWidgets(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              //color: Colors.white30,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "$imagePath$imageList",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
