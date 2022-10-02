import 'package:flutter/material.dart';
import 'package:prega/pages/entry_page.dart';

final List<OnboardData> onboardList = [
  OnboardData("assets/images/docPic.png", "Best Pregnancy Advice & Tips",
      "Learn scientific tips and advice made specially to  help you have a safe delivery."),
  OnboardData("assets/images/splash.png", "Document Free Maternity",
      "Save all documents in Prega and never worry about them again."),
  OnboardData("assets/images/login.png", "Worry-free Delivery",
      "Spend time with your baby and let us help with everything else."),
];

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: onboardList.length,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) => OnboardData(
                onboardList[index]._image,
                onboardList[index]._infoText,
                onboardList[index]._description),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
                onboardList.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ))
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(50)),
          child: ElevatedButton(
            onPressed: () {
              if (_pageIndex == onboardList.length - 1) {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1000),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.ease); //for animation

                          return ScaleTransition(
                            scale: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return EntryPage();
                        }));
              }
              _pageController.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: CircleBorder(),
            ),
            child: Icon(
              Icons.navigate_next_sharp,
              size: 30,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 20 : 15,
      width: isActive ? 20 : 15,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.black38,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class OnboardData extends StatelessWidget {
  OnboardData(_image, _infoText, _description) {
    this._image = _image;
    this._infoText = _infoText;
    this._description = _description;
  }
  String _image = "", _infoText = "", _description = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            _image,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            _infoText,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(height: 20),
          Text(
            _description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
