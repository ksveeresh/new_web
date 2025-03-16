import 'package:flutter/material.dart';


const String root = "/";
const String login = "/login";
const String welcome = "/welcome";
const String dashboard = "/dashboard";
const String signUp = "/signup";
const String home = "/home";
const String changePassword = "/changepassword";
const String forgetPassword = "/forgotpassword";
const String ticketView = "/ticketView";
const String tickets = "/ticketPage";
const String profiles = "/profile";

class Asset {
  static AssetName get string => AssetName();
  static AssetRoot get rootName => AssetRoot();
}

class AssetRoot {
  String get images => "assets/img/";
}

class AssetName {
  String get aLogo => prefixWithAssetRootName("logo.png");
  String get kLogo => prefixWithAssetRootName("kesarlas_logo.png");
  String get kProd => prefixWithAssetRootName("prod.jpeg");
  String get kBanner=> prefixWithAssetRootName("banner.jpg");
  String get kBanner1=> prefixWithAssetRootName("b1.jpeg");
  String get key1=> prefixWithAssetRootName("key1.jpeg");
  String get key2=> prefixWithAssetRootName("key2.jpeg");

}

class Content {
  static Default get name => Default();
  static Avatar get avatar => Avatar();
  // static PusherConstant get pusher => PusherConstant();
  static ScreenName get screen => ScreenName();
  static FcmDbConstant get fcmnode => FcmDbConstant();
  static String update(String name) {
    return name;
  }
}

class SharedPreference {
  static SharedPreferenceConstant get name => SharedPreferenceConstant();
}

class Avatar {
  String get arPlaceholder =>
      'https://ai-octopus.com/assets/img/scrm/logo_avatar.png';
  String get arNoUser => 'https://ai-octopus.com/assets/img/no-user.jpg';
}

class FcmDbConstant {
  String get pAppKey => "048881802ea8ef44b68d";
  String get pCluster => 'ap2';

  String get pSyncDatabase => 'syncdashboard';
  String get pNewChatMessage => 'newmessage';
  String get pNewFeed => 'newfeed';
  String get pTicketAssigned => 'ticketassigned';
  String get pTicketReassigned => 'ticketreassigned';
  String get pTicketAbandon => 'ticketabandon';
  String get pTicketRemoved => 'ticketclosed';
  String get pTicketRemoved1 => 'ticketremoved';
  String get pNewCommentMessage => 'comment';
}

class SharedPreferenceConstant {
  String get sApplicationStarted => "initiated";
  String get sEmailID => "EmailID";
  String get sPassword => "Password";
  String get sLoggedIn => "isLoggedIn";
  String get sUserDetails => "data";
  String get sTabBarHeight => 'TabBarHeight';
}



class ScreenName {
  Constant get language => Constant();
}

class Constant {
  double get width => 60;
  double get height => 30;
}

class Default {
  String get tRememberMe => "Remember me";

}

String prefixWithAssetRootName(String name) {
  return "${Asset.rootName.images}$name";
}

