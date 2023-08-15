import 'package:demo/screen/analog_watch.dart';
import 'package:demo/screen/strap_watch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true,),
    //
    debugShowCheckedModeBanner: false,

    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("Clock App"),
        centerTitle: true,

      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("...Jay Shree Ram...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.orangeAccent),),

            Transform.rotate(angle: 0,
            child: Container(
              height: 250,
              width: 250,
              decoration:BoxDecoration(image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF-B3X3PNj-26pmfxryf14wZ_TCkRVvNUnTA&usqp=CAU")),
                   borderRadius: BorderRadius.all(Radius.circular(320),

                   )

              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.all(60),
                child: Row(
                      children: [
                        Text(
                          "${h}",
                          style: TextStyle(color: Colors.white,fontSize: 25),

                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${m}",
                          style: TextStyle(color: Colors.white,fontSize: 25),


                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${s}",
                          style: TextStyle(color: Colors.white,fontSize: 25),

                        ),
                        SizedBox(width: 20,),
                       //
                      ],
                    ),
              ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
