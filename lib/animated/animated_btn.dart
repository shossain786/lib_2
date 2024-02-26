import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController _animationController;

  double _containerPaddingLeft = 20.0;
  late double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  late bool show;
  bool sent = false;
  Color _color = Colors.lightBlue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    show = true;
    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _color = Colors.green;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 20.0;
          sent = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(100.0),
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        _animationController.forward();
                      },
                      child: AnimatedContainer(
                          decoration: BoxDecoration(
                            color: _color,
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                color: _color,
                                blurRadius: 21,
                                spreadRadius: -15,
                                offset: const Offset(
                                  0.0,
                                  20.0,
                                ),
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: _containerPaddingLeft,
                              right: 20.0,
                              top: 10.0,
                              bottom: 10.0),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutCubic,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              (!sent)
                                  ? AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.fastOutSlowIn,
                                      transform: Matrix4.translationValues(
                                          _translateX, _translateY, 0)
                                        ..rotateZ(_rotate)
                                        ..scale(_scale),
                                      child: const Icon(Icons.send),
                                    )
                                  : Container(),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 600),
                                child: show
                                    ? const SizedBox(width: 10.0)
                                    : Container(),
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: show ? const Text("Send") : Container(),
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child:
                                    sent ? const Icon(Icons.done) : Container(),
                              ),
                              AnimatedSize(
                                alignment: Alignment.topLeft,
                                duration: const Duration(milliseconds: 600),
                                child: sent
                                    ? const SizedBox(width: 10.0)
                                    : Container(),
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: sent ? const Text("Done") : Container(),
                              ),
                            ],
                          ))))),
        ],
      )),
    );
  }
}
