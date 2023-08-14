import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_project/providers/all_products_provider.dart';
import 'package:interview_project/screens/all_products_screen.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:provider/provider.dart';

import '../repositories/login_repo.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey=GlobalKey();
TextEditingController _usernameController=TextEditingController();
TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor is used to set Status bar color in Android devices.
      statusBarColor: tealDark,

      // To make Status bar icons color white in Android devices.
      statusBarIconBrightness: Brightness.light,

      // statusBarBrightness is used to set Status bar icon color in iOS.
      statusBarBrightness: Brightness.dark,
      // Here light means dark icon color for Status bar.
    ));
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
resizeToAvoidBottomInset: false,
      body: Column(children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: width,
              height: height*0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF188095),
                    Color(0xFF2AB3C6),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('STC',style: TextStyle(color: whiteColor,fontSize: headingFontSize)),
                    Text('Health',style: TextStyle(color: whiteColor,fontSize: headingFontSize)),
                  ],
                ),
              ),),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('Login',style: TextStyle(color: whiteColor,fontSize: headingFontSize,fontWeight: FontWeight.bold)),
            )
          ],),
        Form(

          key: _formKey,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height*0.03,),

                TextFormField(
controller: _usernameController,
                  decoration: InputDecoration(
                    label: Text("Username"),
                    border: UnderlineInputBorder(),
                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {

                      return "Please enter a valid username";
                    }

                    return null;
                  },
                ),
                SizedBox(height: height*0.02,),

                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(

                    label: Text("Password"),

                    border: UnderlineInputBorder(),

                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty ) {

                      return "Please enter a valid password ";
                    }

                    return null;
                  },

                  obscureText: true,
                ),
                SizedBox(height: height*0.06,),

                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(tealLight)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                    String result= await loginUser(_usernameController.text,_passwordController.text);
                      if(result=='success'){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider<AllProductsProvider>(
                           create: (BuildContext context) => AllProductsProvider(),
                          child: AllProductsScreen(),
                        ),));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
                      }
                    }
                  },
                  child: SizedBox(
                      height: height*0.07,
                      width:width,child: Center(child: Text("Continue",style: TextStyle(color: whiteColor)))),
                ),
                SizedBox(height: height*0.03,),
                TextButton(onPressed: () {

                }, child: Text('Need Help?',style: TextStyle(color: blackColor),))
              ],
            ),
          ),
        ),
      ],),
    );
  }
}