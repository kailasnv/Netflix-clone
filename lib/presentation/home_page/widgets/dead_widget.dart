// ignore_for_file: unused_element

import 'dart:async';
import 'package:flutter/material.dart';

//  loading feedback widget
class DeadListviewWidget extends StatefulWidget {
  const DeadListviewWidget({super.key});

  @override
  State<DeadListviewWidget> createState() => _DeadListviewWidgetState();
}

class _DeadListviewWidgetState extends State<DeadListviewWidget> {
  //
  List<Color> changeColor1 = [
    Colors.grey.shade900,
    Colors.grey.shade800,
  ];

  // loading animation
  void loadingAnimation() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // ignore: unnecessary_this
      if (this.mounted) {
        setState(() {
          changeColor1 = changeColor1.reversed.toList();
        });
      }

      // while dispose
      @override
      void dispose() {
        timer.cancel();
        timer;
        super.dispose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loadingAnimation();
    return SizedBox(
      width: double.infinity,
      height: 210,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 9, left: 8, bottom: 9, right: 100),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: changeColor1,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1400),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: changeColor1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
