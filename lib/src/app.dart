import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/ui/pages/business_profile/business_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/credit_history.dart';
import 'package:me_talk/src/ui/pages/business_profile/purchase_credit.dart';
import 'package:me_talk/src/ui/pages/business_profile/revenue_management.dart';
import 'package:me_talk/src/ui/pages/business_request/aggreement_screen.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/ui/pages/dashboard/dashboard.dart';
import 'package:me_talk/src/ui/pages/login&signup/find_id_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/find_pw_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/login_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/recommend_code.dart';
import 'package:me_talk/src/ui/pages/splash/ask_permissions.dart';
import 'package:me_talk/src/utils/pagerouting/slideleftroute.dart';
import 'blocs/bloc_main/bloc.dart';
import 'ui/pages/beauty/view_shop/view_shop_profile.dart';
import 'ui/pages/business_profile/contact_manager.dart';
import 'ui/pages/business_profile/shop_profile/post_address_pick.dart';
import 'ui/pages/business_profile/shop_profile/post_info.dart';
import 'ui/pages/business_profile/shop_profile/shop_profile.dart';
import 'ui/pages/business_profile/shop_profile/update_shop_profile.dart';
import 'ui/pages/business_profile/shop_profile/upload_portfolio_pics.dart';
import 'ui/pages/business_request/business_request.dart';
import 'ui/pages/business_request/event_category_list_screen.dart';
import 'ui/pages/business_request/hospital_request.dart';
import 'ui/pages/business_request/shop_request.dart';
import 'ui/pages/image_click_page/image_click_page.dart';
import 'ui/pages/login&signup/email_login.dart';
import 'ui/pages/login&signup/register_page.dart';
import 'ui/pages/login&signup/register_page_2.dart';
import 'ui/pages/profile/edit_profile.dart';
import 'ui/pages/profile/profile_page.dart';
import 'ui/pages/profile/update_phoneno.dart';
import 'ui/pages/slider_click_page/slider_click_page.dart';
import 'ui/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  final MainBloc mainBloc = MainBloc();

  void dispose() {
    mainBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashPage(),
      theme: ThemeData(
          //primaryColor: Colors.transparent,
          primaryColor: ColorsHelper.whiteColor(),
          accentColor: ColorsHelper.themeBlackColor(),
          backgroundColor: ColorsHelper.whiteColor(),
          fontFamily: FontsHelper.fonts_THEjunggt140),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    var page;
    String routeName = settings.name;
    switch (routeName) {
      case SplashPage.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: SplashPage());
        break;
      case LoginPage.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: LoginPage());
        break;
      case RecommendCode.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: RecommendCode());
        break;
      case EmailLogin.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: EmailLogin());
        break;
      case RegisterPage.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: RegisterPage());
        break;
      case RegisterPage2.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: RegisterPage2());
        break;
      case Dashboard.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: Dashboard());
        break;
      case ProfilePage.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: ProfilePage());
        break;
      case EditProfile.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: EditProfile());
        break;
      case UpdatePhoneNo.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: UpdatePhoneNo());
        break;
      case BusinessRequest.routeName:
        page = BlocProvider(
            create: (context) => mainBloc, child: BusinessRequest());
        break;
      case ShopRequest.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: ShopRequest());
        break;
      case HospitalRequest.routeName:
        page = BlocProvider(
            create: (context) => mainBloc, child: HospitalRequest());
        break;
      case BusinessProfile.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: BusinessProfile(
              businessDetailData: settings.arguments,
            ));
        break;

      case TypeOfBusiness.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: TypeOfBusiness(
              type: settings.arguments,
            ));
        break;
      case ShopProfile.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: ShopProfile(
              shopDetailsBeansData: settings.arguments,
            ));
        break;
      // case HospitalProfile.routeName:
      //   page = BlocProvider(
      //       create: (context) => mainBloc, child: HospitalProfile());
      //   break;
      case UpdateShopProfile.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: UpdateShopProfile(
              subCatProfileId: settings.arguments,
            ));
        break;
      case UploadPortfolioPics.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: UploadPortfolioPics(
              subCatProfileId: settings.arguments,
            ));
        break;
      case ContactManager.routeName:
        page = BlocProvider(
            create: (context) => mainBloc, child: ContactManager());
        break;
      case PurchaseCredit.routeName:
        page = BlocProvider(
            create: (context) => mainBloc, child: PurchaseCredit());
        break;
      case RevenueManagement.routeName:
        page = BlocProvider(
            create: (context) => mainBloc, child: RevenueManagement());
        break;
      case CreditHistory.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: CreditHistory());
        break;
      case PostInfo.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: PostInfo(
              postId: settings.arguments,
            ));
        break;
      case CreditHistory.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: CreditHistory());
        break;
      case PostAddressPick.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: PostAddressPick(
              subCatProfileId: settings.arguments,
            ));
        break;
      case AskPermission.routeName:
        page =
            BlocProvider(create: (context) => mainBloc, child: AskPermission());
        break;
      case ViewShopProfile.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: ViewShopProfile(
              shopDetailsBeansData: settings.arguments,
            ));
        break;
      case SliderClickPage.routeName:
        page = BlocProvider(
            create: (context) => mainBloc, child: SliderClickPage());
        break;
      case ImageClickPage.routeName:
        page = BlocProvider(
            create: (context) => mainBloc,
            child: ImageClickPage(
              postId: settings.arguments,
            ));
        break;
      case FindPwPage.routeName:
        page =FindPwPage();
        break;
      case FindIDPage.routeName:
        page =FindIDPage();
        break;
      case AggreementScreen.routeName:
        page =AggreementScreen();
        break;
      case EventCategoryListScreen.routeName:
        page = EventCategoryListScreen();
        break;
    }

    return SlideLeftRoute(widget: page);
  }
}
