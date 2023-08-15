import 'dart:math';

import 'package:flutter/material.dart';

class strap_watch extends StatefulWidget {
  const strap_watch({super.key});

  @override
  State<strap_watch> createState() => _strap_watchState();
}

class _strap_watchState extends State<strap_watch> {
  int h=0;
  int s=0;
  int m=0;

  myclock(){
    Future.delayed(Duration(seconds: 1), (){
      setState(() {
        h = DateTime.now().hour % 12;
        s = DateTime.now().second;
        m = DateTime.now().minute;
      });
      myclock();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myclock();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Strap Watch"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ...List.generate(24, (index) => Transform.rotate(
                  angle: 2* pi*index/24,

                  child: Divider(
                    indent: MediaQuery.of(context).size.width*0.4,
                   endIndent:MediaQuery.of(context).size.width*0.5,
                    thickness: 3,
                    color: Colors.indigo,

                  ))),

              Transform.scale(
                scale: 8,
                child: CircularProgressIndicator(
                  color: Colors.lightGreen,
                  strokeWidth: 3,
                  value: s.toDouble()/60,
                ),
              ),
              Transform.scale(
                scale: 6,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 5,
                  value: m.toDouble()/60,
                ),
              ),
              Transform.scale(
                scale: 4,
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 7,
                  value: h.toDouble()/12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
