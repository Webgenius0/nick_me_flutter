// ignore_for_file: constant_identifier_names, unnecessary_string_interpolations
const String url = "https://admin.askthestoics.com/api";
const String imageUrl = "${url}";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

// final class PaymentGateway {
//   PaymentGateway._();
//   static String gateway(String orderId) =>  "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
// }

final class Endpoints {
  Endpoints._();

  static String logIn() => "/auth/login";
  static String logOut() => "/auth/logout";
  static String register() => "/auth/register";
  static String otpVerifyRegister() => "/auth/verify-otp";
  static String forgetPass() => "/auth/forget-password";
  static String resetPassrod() => "/auth/reset-password";
  static String resendOtp() => "/auth/resend-otp";
  static String getUserProfile() => "/user/user-info";
  static String updateProfile() => "/user/update-profile";
  static String changePass() => "/user/update-password";
  static String termsAndContitions() => "/terms-and-conditions";
  static String privacyPolicy() => "/privacy-policy";
  static String wisdomAuthors() => "/v1/wisdom/authors";
  static String virtues() => "/v1/virtues";
  static String wisdomGenerate() => "/v1/wisdom/generate";
  static String wisdomSave() => "/v1/wisdom/toggle-save";
  static String wisdomSaveList() => "/v1/wisdom/saved";
  static String deleteAccount() => "/user/delete-account";
  static String updateFCMToken() => "/user/update-profile";
  
  

  // static String emailOtpForgetPass() => "/auth/verify-otp";

  static String destinationsList({
    int? perPage,
    String? search,
    String? country,
    int? page,
  }) {
    String endpoint = "/destinations";
    Map<String, dynamic> queryParams = {};
    if (perPage != null) queryParams['per_page'] = perPage;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (country != null && country.isNotEmpty) queryParams['country'] = country;
    if (page != null) queryParams['page'] = page;
    if (queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      endpoint += '?$queryString';
    }
    return endpoint;
  }
}
