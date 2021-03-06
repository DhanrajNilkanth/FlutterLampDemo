import 'package:flutter/material.dart';
import 'package:lamp_bottom_navigation/lamp_bottom_navigation.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppDemo(),
    );
  }
}

class AppDemo extends StatefulWidget {
  @override
  _AppDemoState createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {

  int currentPage = 0;
  PageController _pageController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(50),
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            currentPage = index;
          });
        },
        children: [
          Center(
           child: Text('Page 1',style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
          Center(
            child: Text('Page 2',style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
          Center(
            child: Text('Page 3',style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
          Center(
            child: Text('Page 4',style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
        ],
      ),
      bottomNavigationBar: LampBottomNavigationBar(
        width: double.infinity,
        onTap: (index){
          setState(() {
            currentPage = index;
          });
          _pageController.jumpToPage(index);
        },
        items: <IconData>[
          Icons.home,
          Icons.message,
          Icons.settings,
          Icons.notifications
        ],
        currentIndex: currentPage,

      ),
    );
  }
}













