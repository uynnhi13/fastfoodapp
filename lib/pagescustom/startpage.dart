import 'package:fastfoodapp/pagescustom/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

//import on board me dependency 

class StartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }

}

class _IntroScreen extends State<StartPage>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = const PageDecoration(
          titleTextStyle: TextStyle(fontSize: 28.0, 
                    fontWeight: FontWeight.w700, 
                    color:Colors.white 
                  ), //tile font size, weight and color
          bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.white), 
          //body text size and color
          //descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          //decription padding
          imagePadding: EdgeInsets.all(70), //image padding
          boxDecoration:BoxDecoration(
              color: Colors.amber
          ), //show linear gradient background of page  
    );

    return IntroductionScreen(
          globalBackgroundColor: Color.fromARGB(255, 149, 45, 55),
          //main background of screen
          pages: [ //set your page view here
          
            PageViewModel(
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",
              image: introImage('assets/startpage/intro_slide1.png', 450.0, 300.0),
              decoration: pageDecoration,
          
            ),
            PageViewModel(
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",
              image: introImage('assets/startpage/intro_slide2.png',350.0, 200.0),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",
              image: introImage('assets/startpage/intro_slide3.png',350.0, 200.0),
              decoration: pageDecoration,
            ),

            //add more screen here
          ],

          onDone: () => goHomepage(context), //go to home page on done
          onSkip: () => goHomepage(context), // You can override on skip 
          showSkipButton: true,
          //skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          next: const Icon(Icons.arrow_forward, color: Colors.white,),
          done: const Text('Getting Stated', style: TextStyle(
               fontWeight: FontWeight.bold, color:Colors.white,fontSize: 20, 
              ),),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0), //size of dots
            color: Colors.white, //color of dots
            activeSize: Size(22.0, 10.0),
            //activeColor: Colors.white, //color of active dot
            activeShape: RoundedRectangleBorder( //shave of active dot
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        );
  }

  void goHomepage(context){
     Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){ 
           return WelcomePage();
        }
    ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName, double width, double height) {
   //widget to show intro image
  return Align(
    child: Image.asset('$assetName', width: width, height: height),
    alignment: Alignment.bottomCenter,
    );
  }
}