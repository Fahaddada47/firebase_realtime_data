
import 'package:firebase_sample02/home_screen.dart';
import 'package:firebase_sample02/match_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootballLiveScore extends StatelessWidget {
  const FootballLiveScore({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MatchList(),
    );
  }
}