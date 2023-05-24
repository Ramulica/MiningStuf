import 'package:flutter/material.dart';
import 'package:thefirstgame/models/mines_info.dart';

class ResourcesBar extends StatelessWidget {
  num gold;
  int diamonds;
  ResourcesBar(this.diamonds, this.gold);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: 
        Row(
          children: [
            InkWell(
              onTap: () {
                print("settings");
              },
              child: Image.asset("imgs/settingsButton.png"),
            ),
            Stack(
              children: [
                Image.asset("imgs/dimonds_frame.png"),
                Container(
                  height: 40,
                  width: 102,
                  child: Align(
                    alignment: Alignment(-0, 0),
                    child: Text(
                      "${diamonds}",
                        style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                        ),
                    ),
                  ),
                )
                ]
              ),
            Stack(
              children: [
                Image.asset("imgs/gold_frame.png"),
                Container(
                  height: 40,
                  width: 160,
                  child: Align(
                    alignment: Alignment(0.3, 0),
                    child: Text("${showMoney(gold)}", 
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                        ),
                      ),
                  ),
                )
                ]
              ),
          ],
        ),
    );
  }
}