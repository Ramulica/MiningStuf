import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import './widgets/specialButton.dart';
import './main.dart';
import './models/globals.dart' as globals;
import './models/mines_info.dart';


class PlayersMines extends StatefulWidget {
  List listOfMines = [];
  PlayersMines(this.listOfMines);

  @override
  State<PlayersMines> createState() => _PlayersMinesState(listOfMines);
}

class _PlayersMinesState extends State<PlayersMines> {
  List listOfMines;
  bool robotRight = false;
  double robotLocation = 40;
  int robotTimer = 0;
  double income = 0;

  _PlayersMinesState(this.listOfMines);

  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration(milliseconds: 1000), (timer){
    setState(() {
      if (robotLocation >= 240) {
        if (robotTimer == 0){
          robotTimer = 5;
        } else{
          robotTimer -= 1;
          if (robotTimer == 0) {
            robotRight = false;
            if (listOfMines.isNotEmpty){
              listOfMines[0].giveMoney = true;
            }
          }
        }
        
      } else if (robotLocation <= 40){
        if (robotTimer == 0){
          robotTimer = 5;
        } else{
          robotTimer -= 1;
          if (robotTimer == 0) {
            robotRight = true;
          }
        }
      }




      if (robotRight && robotTimer <= 0) {
        robotLocation += 50;
      }else if (robotTimer <= 0){
        robotLocation -= 50;
      }
      
    });
    
  });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Column(
          children: [
            ...listOfMines.map((e) => 
            Stack(
              children: [
                Image.asset(e.mineImage),
                Container(
                  width: 410,
                  height: 165,
                  child: Align(
                    alignment: Alignment(-0.95, 0.80),
                    child: Container(
                      child: Image.asset(e.rockImage),
                      width: 70,
                      ),
                    
                    ),
                ),
                
          AnimatedPositioned(
            width: 410 ,
            height: 165,
            left: robotLocation,
            duration: const Duration(seconds: 3),

            
              child: Container(
                
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      child: Align(
                    alignment:robotRight? Alignment(-0.3, 0.4) : Alignment(-0.95, 0.7),
                    child: Container(
                      child: Transform.rotate(
                        angle:robotRight? 270 * pi / 180 : 180 * pi / 180 ,
                        child:  Image.asset("imgs/pixel-art-drill.gif")),
                      
                      width: 60,
                      
                      )
                      )
                      ),
                    Container(
                      width: 100,
                      child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Container(
                      child: robotRight? Image.asset("imgs/mining_robot2.png") : Image.asset("imgs/mining_robot.png"),
                      width: 50,
                      
                      )
                      )
                      ),

                  ],
                ),
              ),
            ),
          Container(
            width: 410 ,
            height: 165,
            child: Align(
               alignment: Alignment(0, -0.95),
              child: Stack(
                children: [
                  Container(
                    color: Color.fromARGB(255, 44, 44, 44),
                    height: 35,
                    width: 372,
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                      height: 30,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Mine ${e.mineIndex}  ",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                ),
                                Text(
                                "Lv ${e.lv}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                            ],
                          ),
                            Text(
                            "Income: ${showMoney(e.mineIncome * globals.moneyMultyplier)}",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            )
                        ]
                        ),
                    ),),
                    SizedBox(width: 10,),
                    ResourcesButton(
                      "Upgrade", 
                      showMoney(e.upgradePrice), 
                      "imgs/mining_coin.png", 
                      () {
                        if (globals.balnace >= e.upgradePrice){
                        e.lv += 1;
                        globals.balnace -= e.upgradePrice;
                        }
                        
                      },
                        globals.balnace >= e.upgradePrice?  Colors.green : Color.fromARGB(255, 95, 95, 95)),
                    SizedBox(width: 10),
                    ResourcesButton(
                      "Upgrade x10", 
                      showMoney(e.upgradePriceX10), 
                      "imgs/mining_coin.png", 
                     () {
                        if (globals.balnace >= e.upgradePriceX10){
                        e.lv += 10;
                        globals.balnace -= e.upgradePriceX10;}
                      },
                     globals.balnace >= e.upgradePriceX10?  Colors.green : Color.fromARGB(255, 95, 95, 95)),
                    SizedBox(width: 40)
                  ],
                ),
                ]
              ),
            ),
          )


              ]
          ),)
          ],
        ),
      ],
    );
  }
}