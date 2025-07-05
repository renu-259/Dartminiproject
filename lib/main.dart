import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFFF59042)
    ),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  double _height=170.0;
  double _weight=75.0;
  int _bmi=0;
  String _condition='Result';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(height:size.height*0.50 ,
           width: double.infinity,
           decoration:BoxDecoration(color: Color(0xFFF59042)),
           padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
           child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text("BMI",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 60.0),),
              Text("Calculator",style: TextStyle(color:Colors.white,fontSize: 40.0),),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Text("$_bmi",
                  style: TextStyle(color:Colors.white,
                fontWeight:FontWeight.bold,
                fontSize: 40.0),textAlign: TextAlign.right, ),
                ),
              ),
              RichText(text: TextSpan(text: "condition:",
              style: TextStyle(color: Colors.white,
              fontSize: 25.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "$_condition",
              style: TextStyle(color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,

                ),),
                
              ]
              ),
              
              )
            ],
           ),
           ), 
           Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            width: double.infinity,
            child: Column(
              children: [
              SizedBox(height: size.height*0.03,),  
               Text("Choose Data",style: TextStyle(color: const Color.fromARGB(189, 233, 108, 5),
               fontWeight: FontWeight.bold,fontSize: 30.0),),
               SizedBox(height: size.height*0.03,), 
              RichText(text: TextSpan(text: "Height:",
              style: TextStyle(color: const Color.fromARGB(255, 75, 74, 74),
              fontSize: 25.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "$_height",
              style: TextStyle(color: const Color.fromARGB(255, 58, 57, 57),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,

                ),),
                  
              ]
              ),
              
              ),
              Slider(
                value:_height,
                min: 0,
                max: 250,
                onChanged:(height){
                  setState(() {
                    _height=height;
                  });
                },
                divisions: 250,
                label: "$_height",
              ),
              SizedBox(height: size.height*0.03,), 
              RichText(text: TextSpan(text: "Weight:",
              style: TextStyle(color: const Color.fromARGB(255, 75, 74, 74),
              fontSize: 25.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "$_weight",
              style: TextStyle(color: const Color.fromARGB(255, 58, 57, 57),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,

                ),),
                  
              ]
              ),
              
              ),
               Slider(
                value:_weight,
                min: 0,
                max: 250,
                onChanged:(weight){
                  setState(() {
                    _weight=weight;
                  });
                },
                divisions: 250,
                label: "$_weight",
              ),
               SizedBox(height: size.height*0.03,), 
              SizedBox(height: size.height * 0.03),
Container(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(30.0), // ✅ Fixed here
    child: TextButton(
      onPressed: () {
        setState(() {
          _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
          String condition = "";

if (_bmi < 18.5) {
  _condition = "Underweight";
} else if (_bmi >= 18.5 && _bmi < 25) {
  _condition = "Normal";
} else if (_bmi >= 25 && _bmi < 30) {
  _condition = "Overweight";
} else {
  _condition = "Obesity";
}

print("BMI: $_bmi");
print("Condition: $condition");
        });
        print("BMI Calculated!");
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      ),
      child: Text(
        "Calculate BMI",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    ),
  ),
),
 
                      
            
          ]),
          
    
      
           ),
    ])
    )
    );
  }
}

