import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/ui/pages/splash/ask_permissions.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
//  MainBloc mainBloc;
  bool isLogin = false, isPermitted;
  Permit permit = Permit();
  bool loadingIt = true;
  @override
  void initState() {
//      Future.delayed(Duration(milliseconds: 2500)).then((_)
//       { setState(() {
//            loadingIt = false;
//          });
// launchLoginOrDashboardPage();
//      }
//         );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Timer(Duration(seconds: 0), () => launchLoginOrDashboardPage());
  }

//comment 1added
  @override
  void dispose() {
    // _scaffoldKey = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/logo_MT.flr',
      next: (context) {
        launchLoginOrDashboardPage(context);
        return Container();
      },
      backgroundColor: Colors.white,
      // isLoading: loadingIt,
      until: () => Future.delayed(Duration(milliseconds: 2500)),
      startAnimation: 'splashScreen',
    );
  }

  void launchLoginOrDashboardPage(BuildContext context) async {
    isLogin = await SharePreferencesHelper.getInstant()
        .getBool(SharePreferencesHelper.Is_Login);
    bool isPermitted = await Permit.checkPermissions();
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BusinessRequest()));
    if (!isPermitted) {
      AppNavigator.launchAskPermission(context);
    } else if (isLogin) {
      AppNavigator.launchDashboard(context);
    } else {
      AppNavigator.launchLoginPage(context);
    }
  }
}
