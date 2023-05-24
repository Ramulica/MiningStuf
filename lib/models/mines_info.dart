import 'package:flutter/foundation.dart';

class MineInfo {
  int mineIndex;
  List rocksList = ["imgs/simple_rock.png"];
  int rockImageIndex;
  String get rockImage => rocksList[rockImageIndex];
  String mineImage = "imgs/mine_image.png";
  double moneyMultyplier;
  int lv = 1;
  num get mineIncome => incomeCalculator(mineIndex) * (1 + (0.5 * lv));
  num get upgradePrice => (1 + (0.02 * lv)) * mineIncome;
  num get upgradePriceX10 => upgradePrice * 10 * 1.1;
  
  bool giveMoney = false;
  
  
  MineInfo(this.mineIndex, this.rockImageIndex, this.moneyMultyplier);

  num incomeCalculator(n) {
    num factorialNum = 1;
    num incomeDevider =n <= 12? 1 - ((n-1) * 0.05): 0.4;
      for (var i = 1; i <= n; i++){
        if (41000 > factorialNum){
          factorialNum *= i * incomeDevider;
        } else { 
          factorialNum *= 2 * (n/12);
        }
        
      }
    return factorialNum;
  }


  }

  
  String showMoney(number){
      String output = "";
      
      
  
      if (number < 1000000){
        output = number.toStringAsFixed(1);
      }else if (number < 1000000000){
        number = number.toInt();
        output = "${number.toString().substring(0, number.toString().length-6)}.${number.toString().substring(number.toString().length-6, number.toString().length-5)}mil";
      }else if (number < 1000000000000){
        number = number.toInt();
        output = "${number.toString().substring(0, number.toString().length-9)}.${number.toString().substring(number.toString().length-9, number.toString().length-8)}bil";
      }else if (number < 1000000000000000){
        number = number.toInt();
        output = "${number.toString().substring(0, number.toString().length-12)}.${number.toString().substring(number.toString().length-12, number.toString().length-11)}tril";
      }else if (number < 1000000000000000000){
        number = number.toInt();
        output = "${number.toString().substring(0, number.toString().length-15)}.${number.toString().substring(number.toString().length-15, number.toString().length-14)}qtil";
      }else{
        number = number.toInt();
        output = "${number.toString().substring(0, number.toString().length-18)}.${number.toString().substring(number.toString().length-18, number.toString().length-17)}stil";
      }
    return output;
  }

    num costCalculator(n) {
    num factorialNum = 1;
    num incomeDevider =n <= 12? 1 - ((n-1) * 0.05): 0.4;
      for (var i = 1; i <= n; i++){
        if (41000 > factorialNum){
          factorialNum *= i * incomeDevider;
        } else { 
          factorialNum *= 2 * (n/12);
        }
        
      }
    return factorialNum * 5;
    }