import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: otp(),
      )
  );
}

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController textEditingController = TextEditingController();

  int i = 0;

  Random r = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xff15172b),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("OTP Generator", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                color: Color(0xfff6db87),
              ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xfffcf6ba),
                    fontWeight: FontWeight.w600,
                  ),

                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  cursorColor: const Color(0xfffcf6ba),
                  cursorWidth: 2,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: const Color(0xfffcf6ba)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xfffcf6ba)),
                    ),
                    hintText: "Enter OTP Length",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 4),
                      spreadRadius: 0.3,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: InkWell(
                  splashFactory: InkSplash.splashFactory,
                  onTap: () {
                    setState(
                          () {

                        if(textEditingController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter length")));
                        }
                        else{
                          if(int.parse(textEditingController.text) > 0 && int.parse(textEditingController.text) < 7){

                            if(int.parse(textEditingController.text) == 1){
                              i = r.nextInt(9);
                            }
                            if(int.parse(textEditingController.text) == 2){
                              i = r.nextInt(99);
                            }  if(int.parse(textEditingController.text) == 3){
                              i = r.nextInt(999);
                            }  if(int.parse(textEditingController.text) == 4){
                              i = r.nextInt(9999);
                            }  if(int.parse(textEditingController.text) == 5){
                              i = r.nextInt(99999);
                            }  if(int.parse(textEditingController.text) == 6){
                              i = r.nextInt(999999);
                            }

                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("length must be greter then zero and less then 7")));
                          }
                        }
                      },
                    );
                  },
                  child: const Text(
                    "Generate OTP",
                    style: TextStyle(
                      color: Color(0xff15172b),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      const Color(0xfff6db87),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "$i",
                  style: const TextStyle(
                    color: Color(0xff15172b),
                    fontSize: 25,
                    letterSpacing: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 4),
                      spreadRadius: 0.3,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: InkWell(
                  splashFactory: InkSplash.splashFactory,
                  onTap: () {
                    setState(
                          () {
                        textEditingController.clear();
                        i = 0;
                      },
                    );
                  },
                  child: const Text(
                    "Reset",
                    style: const TextStyle(
                      color: const Color(0xff15172b),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
