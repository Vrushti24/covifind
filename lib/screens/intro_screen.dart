import 'package:covifind/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {

  final pageDecoration = PageDecoration(
    titleTextStyle: PageDecoration().titleTextStyle.copyWith(color: Colors.black,fontSize: 20),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black,fontSize: 16),
    contentPadding: const EdgeInsets.all(20),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("assets/images/1.png"),
          title: "Scan X-Ray Images",
          body: "Check whether you are Covid Positive or not just by uploading your x-ray image.",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/images/2.png"),
          title: "Live Covid Data",
          body: "Obtain live covid data of any region all over the world.",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/images/3.png"),
          title: "Book Appointments",
          body: "Book for an appointment with our doctors in case of any symptomatic behaviour",
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showSkipButton: true,
        showNextButton: true,
        skip: Text("SKIP",style: TextStyle(fontSize: 20,color: Colors.blue.shade500),),
        done: Text("DONE",style: TextStyle(fontSize: 20,color: Colors.blue.shade500),),
        next: Text("NEXT",style: TextStyle(fontSize: 20,color: Colors.blue.shade500),),
        onDone: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
        },
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(25.0, 10.0),
            activeColor: Colors.blue.shade500,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}