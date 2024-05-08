
import 'package:fauget/reunion.dart';
import 'package:fauget/vote.dart';
import 'package:flutter/material.dart';
double _containerWidth = 200.0;
  double _scrollPosition = 0.0;
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold (
       body : Container(
          
          child: Column(
            
            children:[
               Container(
            height : 300,
            width:MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/45.png'), fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 30.0,bottom: 10.0,),
            padding : EdgeInsets.only(left: 30,),
            child: Image.asset('assets/images/16.png' ,),
          ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   GestureDetector(
                     child: Container(
                      padding:EdgeInsets.only(left: 10, right:10,  ) ,
                      margin:EdgeInsets.only(left: 10, right:0, bottom:10  ) ,
                      height:200 ,width: MediaQuery.of(context).size.width * 0.46,
                      decoration: BoxDecoration(
                                 color: Color.fromRGBO(28, 120, 117, 0.8),
                                 borderRadius: BorderRadius.circular(20),
                            ),
                      child: Column(mainAxisAlignment:MainAxisAlignment.center ,
                        children: [ 
                        SizedBox(width:150,height : 100, child :Image.asset('assets/images/v.png' ,)),
                        SizedBox(height: 10,),
                        Text("Réunion",style: TextStyle(fontFamily: 'Sora',fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white,),),
                      ]), 
                                   ),
                     onTap:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => Reunion()),
                                                );} ,
                   ),
                   GestureDetector(
                 child: Container(
                  padding:EdgeInsets.only(left: 10, right:10,  ) ,
                  margin:EdgeInsets.only(left: 5, right:10, bottom:10  ) ,
                  height:200 ,width:MediaQuery.of(context).size.width * 0.46,
                  decoration: BoxDecoration(
                             color: Color.fromRGBO(28, 120, 117, 0.8),
                             borderRadius: BorderRadius.circular(20),
                        ),
                  child: Column(mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                   
                    SizedBox(width:150,height : 100, child :Image.asset('assets/images/v2.png' ,)),
                    SizedBox(height: 10,),
                     Text("Vote",style: TextStyle(fontFamily: 'Sora',fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white,),),
                    
                  ]), 
                               ),
                               onTap:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()),
                                            );} ,
               ),
                 ],
               ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   GestureDetector(
                     child: Container(
                      padding:EdgeInsets.only(left: 10, right:10,  ) ,
                      margin:EdgeInsets.only(left: 10, right:0, bottom:10  ) ,
                      height:200 ,width: MediaQuery.of(context).size.width * 0.46,
                      decoration: BoxDecoration(
                                color: Color.fromRGBO(28, 120, 117, 0.8),
                                 borderRadius: BorderRadius.circular(20),
                            ),
                      child: Column(mainAxisAlignment:MainAxisAlignment.center ,
                        children: [ 
                        SizedBox(width:150,height : 100, child :Image.asset('assets/images/b2.png' ,)),
                        SizedBox(height: 10,),
                        Text("Bibliothèque \n numérique",style: TextStyle(fontFamily: 'Sora',fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white,),textAlign: TextAlign.center,),
                      ]), 
                                   ),
                     onTap:(){} ,
                   ),
                   GestureDetector(
                 child: Container(
                  padding:EdgeInsets.only(left: 10, right:10,  ) ,
                  margin:EdgeInsets.only(left: 5, right:10, bottom:10  ) ,
                  height:200 ,width:MediaQuery.of(context).size.width * 0.46,
                  decoration: BoxDecoration(
                             color: Color.fromRGBO(28, 120, 117, 0.8),
                             borderRadius: BorderRadius.circular(20),
                        ),
                  child: Column(mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                   
                    SizedBox(width:150,height : 100, child :Image.asset('assets/images/bb2.png' ,)),
                    SizedBox(height: 10,),
                     Text("Bourse",style: TextStyle(fontFamily: 'Sora',fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white,),),
                    
                  ]), 
                               ),
                               onTap:(){} ,
               ),
                 ],
               ),
               
            ]
          ),
        )
      ),
    );
  }
  
}
Widget _buildContainer(int index) {
    final double containerWidth = _containerWidth +
        (_scrollPosition * (index - 1.0)).abs(); // Calculate dynamic width
    return AnimatedContainer(
      duration: Duration(milliseconds: 300), // Adjust animation duration
      curve: Curves.easeInOut, // Smooth animation curve
      width: containerWidth, // Dynamically adjust width
      height: 100.0, // Set fixed height
      margin: EdgeInsets.symmetric(horizontal: 10.0), // Spacing
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length], // Cycle through primary colors
      ),
      child: Center(
        child: Text('Container $index'),
      ),
    );
  }
