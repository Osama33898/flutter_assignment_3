import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application1/screens/auth/widgets/button_custom.dart';
import 'package:flutter_application1/screens/auth/widgets/image_custom.dart';
import 'package:flutter_application1/screens/auth/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignIn extends StatelessWidget {
  SignIn({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

 Future<void> _dialogBuilder(BuildContext context, String header, String title) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(header),
          content:  Text(
           title,
          ),
          actions: <Widget>[
           
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // sign user in method
  Future<void> signUserIn(BuildContext context) async {
debugPrint(usernameController.text);
    SharedPreferences pref = await SharedPreferences.getInstance();

await pref.setString('password', passwordController.text as String);
await pref.setString('user_name', usernameController.text as String);
                      _dialogBuilder(context,'Succesfull',"Registered Successful"); 

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

            
              const SizedBox(height: 10),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
   MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // sign in button
              MyButton(
                onTap:()=> signUserIn(context),
                textBtn: 'Sign In',
              ),

              const SizedBox(height: 10),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'assets/google.png'),

                  SizedBox(width: 10),

                  // apple button
                  SquareTile(imagePath: 'assets/apple.png')
                ],
              ),

              const SizedBox(height: 10),

          
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  RichText(
      text: TextSpan(
        text: 'Not a member? ',
  style: TextStyle(color: Colors.grey[700]),
          children: [
         
          TextSpan(
              text: 'Login In now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                  
                      
                    ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
  Navigator.pop(context);
                    }) ,
        ],
      ),
    )
                ],
              )
        
              ],
          ),
        ),
      ),
    );
  }
}