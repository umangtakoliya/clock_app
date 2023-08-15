import 'dart:math';

import 'package:flutter/material.dart';

class analog_watch extends StatefulWidget {
  const analog_watch({super.key});

  @override
  State<analog_watch> createState() => _analog_watchState();
}

class _analog_watchState extends State<analog_watch> {
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
      backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100,
      appBar: AppBar(
        title: Text("Analog watch"),
        centerTitle: true,

      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
           children: [
             Text("Titan"),

             Container(

               width: MediaQuery.of(context).size.width,
               height:  MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //backgroundBlendMode: BlendMode.color,
               //
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage("data:image/jpeg;base64,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")),
                borderRadius: BorderRadius.all(Radius.circular(300))
              ),
              // color: Colors.blueGrey,
             ),
             ...List.generate(60, (index) => Transform.rotate(
                 angle: (pi * 2) * ( index /60),
               child:Divider (
                      color: ( index % 5 == 0)? Colors.red: Colors.white,
                      thickness: ( index % 5 == 0)? 10:3,


                 endIndent: MediaQuery.of(context).size.width * 0.9 ,
                 indent:  MediaQuery.of(context).size.width * 0.045,
               ),

                ),
             ),

             Transform.rotate(
               angle: ( pi/ 2),
               child: Transform.rotate(
                 angle: (pi * 2)*(s /60),
                 child: Divider(
                   color: Colors.white,
                   thickness:2 ,
                   endIndent: MediaQuery.of(context).size.width * 0.5,
                   indent: MediaQuery.of(context).size.width * 0.06,


                 ),
               ),
             ),
             Transform.rotate(
               angle: (pi/2),
               child: Transform.rotate(
                 angle: (pi * 2)*(m /60),
                 child: Divider(
                   color: Colors.white,
                   thickness: 4,
                   endIndent: MediaQuery.of(context).size.width * 0.5,
                   indent: MediaQuery.of(context).size.width * 0.12 ,


                 ),
               ),
             ),
             Transform.rotate(
               angle: (pi/2),
               child: Transform.rotate(
                 angle: (pi * 2)*(h /12),
                 child: Divider(
                   color: Colors.white,
                   thickness: 6,
                   endIndent: MediaQuery.of(context).size.width * 0.5,
                   indent: MediaQuery.of(context).size.width * 0.2,

                 ),
               ),
             )




           ],
        ),
      ),
    );
  }
}
