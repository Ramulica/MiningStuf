import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResourcesButton extends StatelessWidget {
  String title;
  String message;
  String imageGorD;
  Color buttonColor;
  VoidCallback buttonPressed;

  ResourcesButton(this.title, this.message, this.imageGorD, this.buttonPressed, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 30,
                    width: 110,
                    child: ElevatedButton(
                       style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor), // Background color
                      ),
                      onPressed: buttonPressed, 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(message),
                              Container(
                                width: 12,
                                height: 12,
                                child: Image.asset(imageGorD)
                                )
                            ],
                          )
                        ],
                      )
                      ),
                  );
  }
}