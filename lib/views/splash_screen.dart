import 'dart:async';
import 'package:akij_assignment/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  Future<void>? launched;


  startTime() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).canvasColor,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: const AssetImage(
                      'assets/logo.png',
                    ),
                    fit: BoxFit.fitWidth,
                    width: animation.value * Get.width * 0.5,
                    height: animation.value * 200,
                  ),
                ),
                // const Text('Gul',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                Text(
                  'Akij Group Assignment',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
