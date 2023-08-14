import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_project/providers/all_products_provider.dart';
import 'package:interview_project/providers/obscure_provider.dart';
import 'package:interview_project/screens/all_products_screen.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:provider/provider.dart';

import '../providers/isloading_provider.dart';
import '../repositories/login_repo.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey=GlobalKey();
final TextEditingController _usernameController=TextEditingController();
final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: tealDark,

      statusBarIconBrightness: Brightness.light,

      statusBarBrightness: Brightness.dark,
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF188095),
                    Color(0xFF2AB3C6),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('STC',style: TextStyle(color: whiteColor,fontSize: headingFontSize)),
                    Text('Health',style: TextStyle(color: whiteColor,fontSize: headingFontSize)),
                  ],
                ),
              ),),
            const Padding(
              padding:  EdgeInsets.all(30.0),
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
                  decoration: const InputDecoration(
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

            Selector<ObscureProvider,bool>(selector: (p0, p1) => p1.obscurePassword,
              builder: (context, obscurePass, child) =>
               TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(

                      label: const Text("Password"),

                      border: const UnderlineInputBorder(),
                      suffixIcon:  IconButton(
                          icon: Icon(
                            obscurePass ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            Provider.of<ObscureProvider>(context,listen: false).obscurePassword=!Provider.of<ObscureProvider>(context,listen: false).obscurePassword;
                          },
                        )
                      ),




                  validator: (value) {

                    if (value == null || value.isEmpty ) {

                      return "Please enter a valid password ";
                    }

                    return null;
                  },

                  obscureText: obscurePass,

                ),
            ),
                SizedBox(height: height*0.06,),

                Selector<isLoadingProvider,bool>(selector: (p0, p1) => p1.isLoading,
                  builder: (context, isLoading, child) {
                  return
                      ElevatedButton(
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(tealLight)),
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
                        Provider.of<isLoadingProvider>(context, listen: false).isLoading=true;

                        String result= await loginUser(_usernameController.text,_passwordController.text);
                        if(result=='success'){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider<AllProductsProvider>(
                             create: (BuildContext context) => AllProductsProvider(),
                            child: AllProductsScreen(),
                          ),));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                        }
                      }
                      Provider.of<isLoadingProvider>(context, listen: false).isLoading=false;
                    },
                    child: SizedBox(
                        height: height*0.07,
                        width:width,child:  Center(child: isLoading?CircularProgressIndicator():Text("Continue",style: TextStyle(color: whiteColor)))),
                  );
                }
                ),
                SizedBox(height: height*0.03,),
                TextButton(onPressed: () {

                }, child: const Text('Need Help?',style: TextStyle(color: blackColor),))
              ],
            ),
          ),
        ),
      ],),
    );
  }
}