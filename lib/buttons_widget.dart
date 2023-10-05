import 'package:flutter/material.dart';

class ButtonBox extends StatefulWidget {
  const ButtonBox({super.key});

  @override
  State<ButtonBox> createState() => _ButtonBoxState();
}

class _ButtonBoxState extends State<ButtonBox> {
  bool isBulbOn = false;

  void toggleBulb() {
    setState(() {
      isBulbOn = !isBulbOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20),
      height: 155,
      width: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 107, 183, 246),
            Color.fromARGB(255, 21, 89, 145),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isBulbOn ? Icons.lightbulb : Icons.lightbulb_outline,
            size: 70.0,
            color: isBulbOn ? Colors.yellow : Colors.white,
          ),
          Switch(
            value: isBulbOn,
            onChanged: (value) {
              toggleBulb();
            },
          ),
          Text(
            isBulbOn ? 'Bulb ON' : 'Bulb OFF',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class SecondButtonBox extends StatefulWidget {
  const SecondButtonBox({super.key});

  @override
  State<SecondButtonBox> createState() => _SecondButtonBoxState();
}

class _SecondButtonBoxState extends State<SecondButtonBox> {
  bool isSocketOn = false;

  void toggleBulb() {
    setState(() {
      isSocketOn = !isSocketOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20),
      height: 155,
      width: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 107, 183, 246),
            Color.fromARGB(255, 21, 89, 145),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSocketOn ? Icons.power : Icons.power_off_outlined,
            size: 70.0,
            color: isSocketOn
                ? const Color.fromARGB(255, 178, 255, 89)
                : Colors.white,
          ),
          Switch(
            value: isSocketOn,
            onChanged: (value) {
              toggleBulb();
            },
          ),
          Text(
            isSocketOn ? 'Socket ON' : 'Socket OFF',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
