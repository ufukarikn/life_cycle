import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LifeCycle(),
    );
  }
}

class LifeCycle extends StatefulWidget {
  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver{
  int counter=0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.paused){ //uygulama arka plana alındığında
      setState(() {
        counter=0;
      });
    }
    if(state==AppLifecycleState.resumed){ // tekrar uygulamaya dönüldüğünde
     print("uygulamaya dönüldü");
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("LifeCycle",style: TextStyle(color: Colors.brown,fontSize: 30),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("$counter",style: TextStyle(color: Colors.brown,fontSize: 40),),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius:BorderRadius.circular(10)
              ),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    counter+=1;
                  });
                },
                child: Text("Arttır"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


