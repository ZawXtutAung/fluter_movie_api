import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget Loading() {
  return Center(
    child: Lottie.asset('assets/lottie/92678-movie.json', height: 200),
  );
}
