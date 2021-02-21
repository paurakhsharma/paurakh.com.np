import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Color(0xffAE3A3A)),
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final snackBar = SnackBar(
    content: Text('Made with ❤️ and Flutter'),
    duration: Duration(seconds: 4),
  );

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });
    return Scaffold(
      key: _scaffoldKey,
      body: ResponsiveWidget(
          largeScreen: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Color(0xff222222),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hi, I'm Paurakh",
                          style: TextStyle(
                            color: Color(0xffF9EFEF),
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 24
                                : 42,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'I instruct computers \nto do cool stuffs',
                          style: TextStyle(
                              color: Color(0xff9D9D9D),
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 16
                                  : 32),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      child: Container(
                    width: 500,
                    child: Image.network(
                        'https://res.cloudinary.com/drmagsvgf/image/upload/v1589005402/profile_pic_c0y01s.jpg'),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          offset: Offset(0, 4),
                          color: Theme.of(context).primaryColor)
                    ]),
                  )),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              constraints: BoxConstraints.expand(),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ButtonTheme(
                    minWidth:
                        ResponsiveWidget.isSmallScreen(context) ? 100 : 200,
                    height: double.infinity,
                    buttonColor: Theme.of(context).primaryColor,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'About me',
                        style: TextStyle(
                            color: Color(0xffF9EFEF),
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 16
                                : 24),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth:
                        ResponsiveWidget.isSmallScreen(context) ? 100 : 200,
                    height: double.infinity,
                    buttonColor: Theme.of(context).primaryColor,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Blogs',
                        style: TextStyle(
                            color: Color(0xffF9EFEF),
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 16
                                : 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {Key key,
      @required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
