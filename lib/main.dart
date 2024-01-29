import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My Application',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My App'),
      //   foregroundColor: Colors.white,
      //   backgroundColor: const Color.fromARGB(245, 133, 90, 11),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 66, 165, 245),
                  Color.fromARGB(255, 16, 89, 172),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/robo.jpg'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Guest User',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.people,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 0),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInExpo,
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('3D Drawer Menu'),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Demo 3D Menu Bar 👉',
                          style: TextStyle(fontSize: 20),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Go To Dashboard'))
                      ],
                    ),
                  ),
                ),
              ));
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
