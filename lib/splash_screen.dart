import 'package:flutter/material.dart';
import 'package:kitoob_app/utls/color.dart';
import 'package:kitoob_app/utls/font_size.dart';
import 'package:kitoob_app/view/sign_in.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState (){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.colorblack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Column(
           children: <Widget>[
             Center(child: Image.asset('asset/images/images.png'),),
             Text("KITOOB", style: TextStyle(fontSize: FontsizeResources.font_size_30, fontWeight: fontWeights_Resources.font_weight_900,),),
           ],
         ),
        ],
      ),
    );
  }
}
