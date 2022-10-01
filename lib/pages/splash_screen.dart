import 'package:flutter/material.dart';
import 'package:prega/pages/home.dart';

class SplashScreen extends StatefulWidget {


  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 1), () {});
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOut); //for animation

              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.center,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return Home();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              "assets/icons/icon.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 33,
            ),
            const Text(
              "Prega.io",
              style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 81, 166, 227),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )));
  }
}
