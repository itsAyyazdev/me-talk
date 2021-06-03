class Api {
  //static const BASE_URL = "http://3.90.49.125/";
  //static const BASE_URL = "https://vg.cisinlive.com/metalk/public/api";
  //static const BASE_URL = "http://192.168.1.4/me-talk/api";
  static const BASE_URL = "http://172.104.54.68/me-talk/api";

  //Login and register module
  static const SOICAL_lOGIN = "/social/login";
  static const REGISTER = "/register";
  static const LOGIN = "/login";
  static const FORGOT_PASSWORD = "/forgot/password";
  static const FORGOT_EMAIL = "/forgot/email";

  //home page module
  static const HOMEPAGE = "/dashboard";

  //beauty page module
  static const BEAUTYPAGE = "/getBeauty";

  //User profile module
  static const PROFILE_EDIT = "/user/profile";
  static const PROFILE_UPDATE = "/profile/update";
  static const CHECK_BUSINESS_INFO = "/check/request";
  static const LOGOUT = "/logout";

  //Business request module
  static const CategoryList = "/category";
  static const BusinessRequest = "/user/request";
  static const CategoryDetails = "/getBusinessCategoryProfile";
  static const UpdateCategoryDetails = "/updateBusinessCategoryProfile";
  static const AddBusinessCategory = "/addBusinessCategoryProfile";

  //Post info
  static const GetPostDetail = "/getGallaryDetail";
  static const DeletePostDetail = "/deleteGallary";

  //Upload portfolio pics
  static const Upload_Portfolio_Pics = "/businessProfile/addGallary";

  //Follow & unfollow business
  static const FollowBusiness = "/followBusiness";
  static const UnFollowBusiness = "/unFollowBusiness";
}
