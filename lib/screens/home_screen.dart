import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialisation();
  }

  var fP = FlutterLocalNotificationsPlugin();

  Future<void> initialisation() async {
    var androidSetup = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetup = IOSInitializationSettings();
    final setupNotification =
        InitializationSettings(android: androidSetup, iOS: iosSetup);
    await fP.initialize(setupNotification,
        onSelectNotification: selectNotification);
  }

  Future<void> selectNotification(String payload) {
    if (payload != null) {
      print(payload);
    }
  }

  Future<void> displayingNotification() async {
    var androidDetail = AndroidNotificationDetails(
      "id",
      "name",
      "description",
      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,
    );
    var iosDetail = IOSNotificationDetails();
    final allDetail =
        NotificationDetails(android: androidDetail, iOS: iosDetail);
    await fP.show(0, "title", "body", allDetail,
        payload: "first notifications");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                displayingNotification();
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
