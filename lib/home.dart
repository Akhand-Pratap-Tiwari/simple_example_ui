import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'shared_widgets.dart';
import 'strings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController(initialPage: 0);
  final imgPath = [
    'assets/images/clock.png',
    'assets/images/woman_meditating.png',
    'assets/images/conversation.png'
  ];

  int imgNo = 0;

  Widget myWidget = const ImgContainer(imgPath: 'assets/images/clock.png');

  void _incrementText() {
    if (pageController.page == 2) {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        //To prevent Infinite Bounds to the Child
        height: (MediaQuery.of(context).orientation == Orientation.landscape)
            ? MediaQuery.of(context).size.height * 1.5
            : MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.indigo,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo,
            onPressed: _incrementText,
            child: const Icon(
              Icons.arrow_circle_right_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                  child: myWidget,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 20),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: const JumpingDotEffect(
                              verticalOffset: 10,
                              dotColor: Colors.lightBlue,
                              activeDotColor: Colors.indigoAccent),
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          onPageChanged: (value) => setState(() {
                            imgNo = value;
                            myWidget = ImgContainer(
                                key: ValueKey(value), imgPath: imgPath[imgNo]);
                          }),
                          physics: const ClampingScrollPhysics(),
                          controller: pageController,
                          children: const [
                            TextHolder(
                                heading: stringHeading_1,
                                bodyText: stringBody_1),
                            TextHolder(
                                heading: stringHeading_2,
                                bodyText: stringBody_2),
                            TextHolder(
                                heading: stringHeading_3,
                                bodyText: stringBody_3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
