import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spotify/screens/getstarted.dart';

class Loading extends StatefulWidget {
  Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

double _loadingPercentage = 0.0;
late Timer _timer;

class _LoadingState extends State<Loading> {
  void _startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      setState(() {
        if (_loadingPercentage < 2.0) {
          _loadingPercentage += 0.01;
        } else {
          _timer.cancel();
          _navigateToLoginScreen();
        }
      });
    });
  }

  void _navigateToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GetStarted()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/spotify.png')),
    );
  }
}
