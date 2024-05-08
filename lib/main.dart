import 'package:flutter/material.dart';
import 'login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height : 450,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/45.png'), fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 30.0,bottom: 10.0,),
            padding:EdgeInsets.only(left: 0.0,top: 30),
            child: Column(
              children: [
                SizedBox(height:60 ,),
                Image.asset('assets/images/l1.png' ,),
                Text("S G O V S",style: TextStyle(fontFamily: 'Sora',fontSize: 26,fontWeight: FontWeight.bold,color:  Color.fromRGBO(250,166,66,1),),textAlign: TextAlign.center,),
                SizedBox(height :50),
                Row(
                  children: [
                    SizedBox(width:MediaQuery.of(context).size.width * 0.5,),
                    Container(
                      decoration: BoxDecoration(
                           color : Color.fromRGBO(250,166,66,1),
                           borderRadius: BorderRadius.circular(20),
                      ),
                      height:50 ,
                      width:180 ,
                      child: TextButton(
                           onPressed: () {
                               Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
            );
                            },
                          child: Text('Commencer',style: TextStyle(fontFamily: 'Sora',fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white,),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height:20,),
          Text("Votre Solution",style: TextStyle(fontFamily: 'Sora',fontSize: 40,fontWeight: FontWeight.bold, color: Color.fromRGBO(28, 120, 117, 1),),),
          SizedBox(height:20,),
          Text('   “moderniser la democratie avec \n    confiance et acessibilite”',style: TextStyle(fontFamily: 'Sora',fontSize: 20,color: Color.fromRGBO(58, 65, 69, 1))),
        ],
      ),



    );
  }
}
