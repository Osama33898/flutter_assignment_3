import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application1/screens/MainPage.dart';
import 'package:flutter_application1/screens/Post_list.dart';

import 'package:flutter_application1/screens/auth/sign_in.dart';
import 'package:flutter_application1/screens/auth/widgets/button_custom.dart';
import 'package:flutter_application1/screens/auth/widgets/image_custom.dart';
import 'package:flutter_application1/screens/auth/widgets/text_field.dart';
import 'package:flutter_application1/screens/movies_list/movies_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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

  Future<void> signUserIn(BuildContext context) async {

          
    debugPrint(usernameController.text);


final SharedPreferences prefs = await SharedPreferences.getInstance();
final String? user_name = prefs.getString('user_name');
final String? password = prefs.getString('password');

    debugPrint(user_name);
    debugPrint(password);


            if(user_name==usernameController.text && password==passwordController.text)
            {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MainPage()),
            );
                      // _dialogBuilder(context,'Succesfull',"Logged In"); 

            }
            else{
                       _dialogBuilder(context,'Failed','Try again'); 

            }
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
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

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

              MyButton(
                onTap: ()=>signUserIn(context),
                textBtn: 'Log In'
              ),

              const SizedBox(height: 10),

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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  RichText(
      text: TextSpan(
        text: 'Not a member? ',
  style: TextStyle(color: Colors.grey[700]),
          children: [
         
          TextSpan(
              text: 'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                  
                      
                    ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SignIn()),
            );
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