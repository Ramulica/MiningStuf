import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import './mines.dart';
import './models/mines_info.dart';
import './widgets/resourcesBar.dart';
import './models/globals.dart' as globals;



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  List mineList = [];
  List get earth => [for (var i = 1; i <= (mineList.length ~/ 2 + 1); i++) "imgs/ground.png"];
  int mineCount = 0;

  void initState(){
    super.initState();
    Timer.periodic(Duration(milliseconds: 200), (timer){
      setState(() {
        if (mineList.isNotEmpty){
          if (mineList[0].giveMoney){
            mineList[0].giveMoney = false;
            for (var i = 0; i < mineList.length; i++){
              globals.balnace += mineList[i].mineIncome * globals.moneyMultyplier;



          }
            }
          }
          for (var i = 0; i < mineList.length; i++){
            

        }
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Stack(
          children: [
            
            SingleChildScrollView( 
              
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
              
              Container(
                width: double.infinity,
                child: MyStatefulWidget(),
               ),
               Container(
                
                child: Image.asset("imgs/grass.png")
              ),
               Container(
                
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ...earth.map((e) => Container(
                          child: Image.asset(e)
              ),),


               
              ],
              
            ),
              Column(
                children: [
                  PlayersMines(mineList),
                  InkWell(
                    onTap: () {
                      if (globals.balnace >= costCalculator(mineCount + 1)){
                        globals.balnace -= costCalculator(mineCount + 1);
                      setState(() {
                        mineList.add(MineInfo(mineList.length + 1, 0, 0));
                        mineCount += 1;
                      print(mineList.length);
                      });
                      }
                    }, // Handle your callback
                    child: Container(
                      width: 410,
                      height: 165,
                      color: Colors.black.withOpacity(0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            child: Image.asset("imgs/+button.png"),
                          ),
                          Text("     Mine ${mineCount + 1} \n Cost: ${showMoney(costCalculator(mineCount + 1))}",  style: const TextStyle(color: Colors.yellow),)]
                        ),
                    ),
                  ),
                ],
              )
                  ]
                )
              ),
                
              ],)

            ),
            ResourcesBar(0, globals.balnace),
          ],
        )
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});
  


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = true;
  double squareLocation = -200;
  double squareLocation2 = -1350;

  int cloudSpeed = 2;
  int cloudSpeed2 = 2;

  List listOfMines = [];
  


  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration(milliseconds: 200), (timer){
      setState(() {
        if (squareLocation <= 950 && selected){
          squareLocation += 10;
          cloudSpeed = 2;
          
        }
        else if (selected){
          cloudSpeed = 0;
          squareLocation = -1350;
          
        }
                if (squareLocation2 <= 950 && selected){
          squareLocation2 += 10;
          cloudSpeed2 = 2;
        }
        else if (selected){
          cloudSpeed2 = 0;
          squareLocation2 = -1350;
          
        }
        
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 1150,
      height: 400,
      child: Stack(
        children: <Widget>[

        
          
          AnimatedPositioned(
            width: 1150 ,
            height: 300,
            left: squareLocation,
            duration:  Duration(seconds: cloudSpeed),

            
              child: Container(
                color: Colors.blue,
                child: Image.asset("imgs/clouds.png"),
              ),
            ),
           AnimatedPositioned(
            width: 1150 ,
            height: 300,
            left: squareLocation2,
            duration:  Duration(seconds: cloudSpeed2),

            
              child: Container(
                color: Colors.blue,
                child: Image.asset("imgs/clouds.png"),
              ),
            ),
        ],
      ),
    );
  }
}
