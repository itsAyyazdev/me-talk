import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:me_talk/src/models/notification_messages.dart';

//  Future getPushToken() async {
//     final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//     await _firebaseMessaging.getToken().then((token) {
//       Firestore.instance
//           .collection('users')
//           .document(StringUsed.getInstance().id)
//           .updateData({'PushToken': token});
//     });
//   }

class Fcm {
  static Fcm fcm = Fcm();
 static bool alreadyInited = false ;
  static getInstance() {
    if (fcm == null) {
      fcm = Fcm();
    }
    return fcm;
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<NotificationMessages> messages = [];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void chatNotification() {
    alreadyInited = true ;
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    _firebaseMessaging.requestNotificationPermissions();
    flutterLocalNotificationsPlugin.initialize(platform);
    _firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      showNotification(message).then((onvalue) {
        return;
      });
      print('onMessage: $message');
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      return;
    });
    // auth.getCurrentUser().then((onValue) {
    //   _firebaseMessaging.getToken().then((token) {
    //     Firestore.instance
    //         .collection('users')
    //         .document(onValue+"_Organizer")
    //         .updateData({'PushToken': token});
    //   }).catchError((err) {
    //     Fluttertoast.showToast(msg: err.message.toString());
    //   });
    // });
  }

  showNotification(Map<String, dynamic> message) async {
    var android = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription');
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    final notification = message['notification'];
    await flutterLocalNotificationsPlugin.show(
        0, notification['title'], notification['body'], platform);
  }
}
