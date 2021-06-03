import 'package:flutter/material.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/models/businessDetailbeans.dart';
import 'package:me_talk/src/ui/pages/beauty/view_shop/view_shop_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/business_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/contact_manager.dart';
import 'package:me_talk/src/ui/pages/business_profile/credit_history.dart';
import 'package:me_talk/src/ui/pages/business_profile/purchase_credit.dart';
import 'package:me_talk/src/ui/pages/business_profile/revenue_management.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/post_address_pick.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/post_info.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/shop_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/update_shop_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/upload_portfolio_pics.dart';
import 'package:me_talk/src/ui/pages/business_request/aggreement_screen.dart';
import 'package:me_talk/src/ui/pages/business_request/business_request.dart';
import 'package:me_talk/src/ui/pages/business_request/event_category_list_screen.dart';
import 'package:me_talk/src/ui/pages/business_request/hospital_request.dart';
import 'package:me_talk/src/ui/pages/business_request/shop_request.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/ui/pages/dashboard/dashboard.dart';
import 'package:me_talk/src/ui/pages/image_click_page/image_click_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/email_login.dart';
import 'package:me_talk/src/ui/pages/login&signup/find_id_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/find_pw_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/login_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/recommend_code.dart';
import 'package:me_talk/src/ui/pages/login&signup/register_page.dart';
import 'package:me_talk/src/ui/pages/login&signup/register_page_2.dart';
import 'package:me_talk/src/ui/pages/profile/edit_profile.dart';
import 'package:me_talk/src/ui/pages/profile/profile_page.dart';
import 'package:me_talk/src/ui/pages/profile/update_phoneno.dart';
import 'package:me_talk/src/ui/pages/slider_click_page/slider_click_page.dart';
import 'package:me_talk/src/ui/pages/splash/ask_permissions.dart';
import 'package:me_talk/src/ui/pages/test.dart';
import 'package:me_talk/src/utils/popup_dialogs/activate_history_popup.dart';

class AppNavigator {
  static void launchTestWidget(BuildContext context) {
    Navigator.pushNamed(context, TestWidget.routeName);
  }

  static void launchLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      LoginPage.routeName,
    );
  }
  static void launchFindIDPage(BuildContext context,bool isFromId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FindIDPage(
      idFromFindIDClick: isFromId,
    )));
  }
  static void launchFindPWPage(BuildContext context, String phoneNumber) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FindPwPage(
      phoneNumber: phoneNumber,
    )));
  }

  static void launchSplashPage(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      LoginPage.routeName,
    );
  }

  static void launchRecommendCodePage(BuildContext context) {
    Navigator.pushNamed(
      context,
      RecommendCode.routeName,
    );
  }

  static void launchEmailLogin(BuildContext context) {
    Navigator.pushNamed(
      context,
      EmailLogin.routeName,
    );
  }

  static void launchRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, RegisterPage.routeName);
  }

  static void launchRegisterPage2(BuildContext context,String phone, String phoneCode) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage2(
      phoneNumber: phone,
      phoneCode: phoneCode,
    )));
  }

  static void launchDashboard(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Dashboard.routeName,
    );
  }

  static void launchProfilePage(BuildContext context) {
    Navigator.pushNamed(context, ProfilePage.routeName);
  }

  static void launchEditProfile(BuildContext context) {
    Navigator.pushNamed(context, EditProfile.routeName);
  }

  static void launchUpdatePhoneNo(BuildContext context) {
    Navigator.pushNamed(context, UpdatePhoneNo.routeName);
  }

  static void launchBusinessRequest(BuildContext context) {
    Navigator.pushNamed(context, BusinessRequest.routeName);
  }

  static void launchShopRequest(BuildContext context) {
    Navigator.pushReplacementNamed(context, ShopRequest.routeName);
  }

  static void launchHospitalRequest(BuildContext context) {
    Navigator.pushReplacementNamed(context, HospitalRequest.routeName);
  }

  static void launchBusinessProfile(
      BuildContext context, BusinessDetailData businessDetailData) {
    Navigator.pushNamed(context, BusinessProfile.routeName,
        arguments: businessDetailData);
  }

  static void launchTypeOfBusiness(BuildContext context) {
    Navigator.pushNamed(context, TypeOfBusiness.routeName);
  }
  static void launchTypeOfBusinessPopup(BuildContext context) {
    Navigator.pushNamed(context, TypeOfBusinesss.routeName);
  }

  static void launchShopProfile(
      BuildContext context, ShopDetailsBeansData shopDetailsBeansData) {
    Navigator.pushNamed(context, ShopProfile.routeName,
        arguments: shopDetailsBeansData);
  }

  // static void launchHospitalProfile(BuildContext context) {
  //   Navigator.pushNamed(context, HospitalProfile.routeName);
  // }

  static void launchUpdateShopProfile(BuildContext context) {
    Navigator.pushNamed(context, UpdateShopProfile.routeName);
  }

  static void launchUploadPortfolioPics(
      BuildContext context, int subCatProfileId) {
    Navigator.pushNamed(context, UploadPortfolioPics.routeName,
        arguments: subCatProfileId);
  }

  static void launchContactManager(BuildContext context) {
    Navigator.pushNamed(context, ContactManager.routeName);
  }

  static void launchpurchaseCredit(BuildContext context) {
    Navigator.pushNamed(context, PurchaseCredit.routeName);
  }

  static void launchRevenueManager(BuildContext context) {
    Navigator.pushNamed(context, RevenueManagement.routeName);
  }

  static void launchPostInfo(BuildContext context, int postId) {
    Navigator.pushNamed(context, PostInfo.routeName, arguments: postId);
  }

  static void launchCreditHistory(BuildContext context) {
    Navigator.pushNamed(context, CreditHistory.routeName);
  }

  static void launchAggreementScreen(BuildContext context) {
    Navigator.pushNamed(context, AggreementScreen.routeName);
  }

  static void launchEventCategoryListScreen(BuildContext context) {
    Navigator.pushNamed(context, EventCategoryListScreen.routeName);
  }

  static void launchPostAddressPick(BuildContext context, int subCatProfileId) {
    Navigator.pushNamed(context, PostAddressPick.routeName,
        arguments: subCatProfileId);
  }

  static void launchAskPermission(BuildContext context) {
    Navigator.pushNamed(context, AskPermission.routeName);
  }

  static void launchViewShopProfile(
      BuildContext context, ShopDetailsBeansData shopDetailsBeansData) {
    Navigator.pushNamed(context, ViewShopProfile.routeName,
        arguments: shopDetailsBeansData);
  }

  static void launchSliderClickPage(
    BuildContext context,
  ) {
    Navigator.pushNamed(context, SliderClickPage.routeName);
  }

  static void launchImageClickPage(BuildContext context, int postId) {
    Navigator.pushNamed(context, ImageClickPage.routeName, arguments: postId);
  }

  // static void launchOBSignUpPage(BuildContext context) {
  //   Navigator.pushNamed(context, OBSignUpPage.routeName);
  // }

  // static void launchOBMerchantProfilePage(BuildContext context,
  //     {bool upEnable = true}) {
  //   if (upEnable) {
  //     Navigator.pushNamed(context, OBMerchantProfilePage.routeName,
  //         arguments: upEnable);
  //   } else {
  //     Navigator.pushReplacementNamed(context, OBMerchantProfilePage.routeName,
  //         arguments: upEnable);
  //   }
  // }

  // static void launchOBRolePermissionManagementPage(BuildContext context,
  //     {bool upEnable = true}) {
  //   if (upEnable) {
  //     Navigator.pushNamed(context, OBRolePermissionManagementPage.routeName,
  //         arguments: upEnable);
  //   } else {
  //     Navigator.pushReplacementNamed(
  //         context, OBRolePermissionManagementPage.routeName,
  //         arguments: upEnable);
  //   }
  // }

  static void popBackStack(BuildContext context) {
    Navigator.pop(context);
  }
}
