import 'package:flutter/material.dart';
import 'package:flutter_application1/helpers/fire_auth.dart';
import 'package:flutter_application1/model/push_notifications.dart';
import 'package:flutter_application1/screens/auth/login_in.dart';
import 'package:flutter_application1/screens/auth/widgets/button_custom.dart';
import 'package:flutter_application1/screens/movies_list/movie_screen_dio.dart';
import 'package:flutter_application1/screens/movies_list/movies_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:overlay_support/overlay_support.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_package_1/flutter_package_1.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
class MainPage extends StatefulWidget {
     final User? user;

  const MainPage({ this.user});

  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
   late final FirebaseMessaging _messaging;
  late int _totalNotifications;
  PushNotification? _notificationInfo;

  late User _currentUser;
   @override
 
  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  @override
  void initState() {
    _totalNotifications = 0;
        _currentUser = widget.user!;

    registerNotification();
    checkForInitialMessage();

    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });

    super.initState();
  }

Future<void> naviagateToHttp(BuildContext context) async {

          
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MoviesListScreen()),
            );


  }
Future<void> naviagateToDio(BuildContext context) async {

    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MoviesListScreenDio()),
            );      

}

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                   Text(
              'NAME: ${_currentUser.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
                  MyButton(
                onTap: ()=>naviagateToHttp(context),
                textBtn: 'HTTP'
              ),
                          SizedBox(height: 16.0),
MyButton(
                onTap: ()async{
                  final Uri _url = Uri.parse('https://flutter.dev');

      if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
                },
                textBtn: 'Open Browser'
              ),
                          SizedBox(height: 16.0),
               MyButton(
                onTap: ()=>naviagateToDio(context),
                textBtn: 'DIO'
              ),
              //   MyButton(
              //   onTap: ()=>naviagateToDio(context),
              //   textBtn: 'DIO'
              // ),
              //   MyButton(
              //   onTap: ()=>naviagateToDio(context),
              //   textBtn: 'DIO'
              // ),
//
                          SizedBox(height: 16.0),

   _isSendingVerification
                ? CircularProgressIndicator()
                :
                      MyButton(
                        onTap: () async {
                          setState(() {
                            _isSendingVerification = true;
                          });
                          await _currentUser.sendEmailVerification();
                          setState(() {
                            _isSendingVerification = false;
                          });
                        },
                textBtn: 'Verify Email'
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () async {
                          User? user = await FireAuth.refreshUser(_currentUser);

                          if (user != null) {
                            setState(() {
                              _currentUser = user;
                            });
                          }
                        },
                      ),
                    
//

               
            SizedBox(height: 16.0),
            _isSigningOut
                ? CircularProgressIndicator()
                : MyButton(
                    onTap: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                textBtn: 'Sign Out'
                   
                ),
  _notificationInfo != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TITLE: ${_notificationInfo!.dataTitle ?? _notificationInfo!.title}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'BODY: ${_notificationInfo!.dataBody ?? _notificationInfo!.body}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                )
              : Container(),
                //
                ],
              )),
        ));

  }
}
class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}