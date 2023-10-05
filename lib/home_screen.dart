import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_exibition_app1/pages/about_page.dart';
import 'package:intl/intl.dart';
import 'package:project_exibition_app1/pages/bulb_page.dart';
import 'package:project_exibition_app1/buttons_widget.dart';
import 'package:project_exibition_app1/chart.dart';
import 'package:project_exibition_app1/pages/socket_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _currentTime = DateTime.now();

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 144, 195, 237),
                ),
                child: Text('Settings'),
              ),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),

      //!  Body part...

      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 170,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 8),
              ],
              gradient: LinearGradient(
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 116, 193, 229),
                  Color.fromARGB(255, 50, 156, 205)
                ],
              ),
              // borderRadius: BorderRadius.all(
              //   Radius.circular(20),
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 5, top: 55),
                  child: Text(
                    DateFormat('hh:mm a').format(_currentTime),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Temperature: Fetch current Temp',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),

          //! home automation details :)

          const SizedBox(
            height: 300,
            child: Graph(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BulbScreen(),
                    ),
                  );
                },
                child: const ButtonBox(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SocketScreen(),
                    ),
                  );
                },
                child: const SecondButtonBox(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
