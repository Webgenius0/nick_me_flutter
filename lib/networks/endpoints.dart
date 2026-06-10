// ignore_for_file: constant_identifier_names, unnecessary_string_interpolations
const String url = "https://nickoleo.thesyndicates.team/api";
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

  static String register() => "/register";
  static String emailVerifyRegister() => "/verify-email";
  static String resendOtp() => "/resend-otp";
  static String logIn() => "/login";
  static String logOut() => "/logout";
  static String forgetPass() => "/forget-password";
  static String emailOtpForgetPass() => "/verify-otp";
  static String resetPassrod() => "/reset-password";
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

  static String getAllQuestions() => "/profile-questions";
  static String submitQuestionAnswer() => "/profile-questions/submit-answers";
  static String getAllCategory() => "/categories";
  static String tripsCreate() => "/trips";
  static String userInformation() => "/me";
  static String savLanguage() => "/app-languages";
  static String stepperPages() => "/stepper-pages";
  static String dropdownOptions() => "/dropdown-options";
  static String profileSetup() => "/update-profile";
  static String destinationData() => "/destinations";

  // static String discoverAll() => "/discover";

  static String discoverAll({
    int? perPage,
    String? holidayType,
    int? locationRadius,
    int? ageMin,
    int? ageMax,
    String? gender,
    String? budget,
    String? travelDestination,
    String? latitude,
    String? longitude,
    int? isFavourite,
    int? isBookmark,
  }) {
    String endpoint = "/discover";
    Map<String, dynamic> queryParams = {};
    if (perPage != null) queryParams['per_page'] = perPage;
    if (holidayType != null &&
        holidayType.isNotEmpty &&
        holidayType != "Any Holiday") {
      queryParams['holiday_type[]'] = holidayType
          .replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '')
          .trim()
          .replaceAll(' ', '_')
          .toLowerCase();
    }
    if (locationRadius != null) queryParams['location_radius'] = locationRadius;
    if (ageMin != null) queryParams['age_min'] = ageMin;
    if (ageMax != null) queryParams['age_max'] = ageMax;
    if (gender != null && gender != "Everyone") {
      queryParams['gender'] = gender.toLowerCase();
    }
    if (budget != null && budget != "Any") {
      queryParams['budget'] = budget;
    }
    if (travelDestination != null && travelDestination != "Any") {
      queryParams['travel_destination'] = travelDestination.toLowerCase();
    }
    if (latitude != null) queryParams['latitude'] = latitude;
    if (longitude != null) queryParams['longitude'] = longitude;
    if (isFavourite != null) queryParams['is_favourite'] = isFavourite;
    if (isBookmark != null) queryParams['is_bookmark'] = isBookmark;

    if (queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      endpoint += '?$queryString';
    }
    return endpoint;
  }

  // static String getAllTrips() => "/trips";
  static String getAllTrips({
    int? perPage,
    String? search,
    String? startDate,
    String? endDate,
    String? categoryId,
    String? destinationId,
    String? age,
    String? ageMin,
    String? ageMax,
    String? gender,
    String? budgetMax,
    String? budgetMin,
  }) {
    String endpoint = "/trips";
    Map<String, dynamic> queryParams = {};
    if (perPage != null) queryParams['per_page'] = perPage;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (startDate != null) queryParams['start_date'] = startDate;
    if (endDate != null) queryParams['end_date'] = endDate;
    if (categoryId != null) queryParams['category_id'] = categoryId;
    if (destinationId != null) queryParams['destination_id'] = destinationId;
    if (age != null && age != "Any") queryParams['age'] = age;
    if (ageMin != null) queryParams['age_min'] = ageMin;
    if (ageMax != null) queryParams['age_max'] = ageMax;
    if (gender != null && gender != "Everyone") queryParams['gender'] = gender;
    if (budgetMax != null) queryParams['budget_max'] = budgetMax;
    if (budgetMin != null) queryParams['budget_min'] = budgetMin;
    if (queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      endpoint += '?$queryString';
    }
    return endpoint;
  }

  // static String getAllTrips() => "/trips/my-trips";
  static String myTrips({
    int? perPage,
    String? search,
    String? startDate,
    String? endDate,
    String? categoryId,
  }) {
    String endpoint = "/trips/my-trips";
    Map<String, dynamic> queryParams = {};
    if (perPage != null) queryParams['per_page'] = perPage;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (startDate != null) queryParams['start_date'] = startDate;
    if (endDate != null) queryParams['end_date'] = endDate;
    if (categoryId != null) queryParams['category_id'] = categoryId;
    if (queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      endpoint += '?$queryString';
    }
    return endpoint;
  }

  static String getSingleTrip(String id) => "/trips/$id";
  static String joinTrips({required String tripId}) => "/trips/join/$tripId";
  static String toggleFavourite({required String discoverId}) =>
      "/discover/users/favourite/$discoverId";
  static String toggleBookmark({required String discoverId}) =>
      "/discover/users/bookmark/$discoverId";
  static String getSinglePeople({required String id}) => "/discover/users/$id";
  static String updateProfile() => "/update-profile";
  static String changePassword() => "/update-password";

  // static String getAllNotification() => "/notifications";
  static String getAllNotification({int? perPage, int? unread}) {
    String endpoint = "/notifications";
    Map<String, dynamic> queryParams = {};
    if (perPage != null) queryParams['per_page'] = perPage;
    if (unread != null) queryParams['unread'] = unread;
    if (queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      endpoint += '?$queryString';
    }
    return endpoint;
  }

  static String markAllAsRead() => "/notifications/mark-all-as-read";
  static String markAsRead(String id) => "/notifications/mark-as-read/$id";
  static String markAsUnread(String id) => "/notifications/mark-as-unread/$id";
  static String notificationSetting() => "/notification-settings";
  static String updateSetting() => "/notification-settings";
  static String getTermsPrivacy({required String slug}) =>
      "/dynamic-pages/$slug";

  static String galleryData() => "/galleries";
  static String deleteImage({required String id}) => "/galleries/$id";
  static String imageUpdate() => "/galleries/batch-update";
  static String createSingleConversation({required String id}) =>
      "/chats/direct/$id";
  static String getSingleChatRoom({required String id}) => "/chats/$id";
  static String sendMessage({required String id}) => "/chats/messages/$id";
  static String getMyJoinRequests() => "/trips/my-join-requests";
  static String verificationStatus() => "/verification/status";
  static String verificationApply() => "/verification/apply";

  static String getMyTripJoinRequests() =>
      "/trips/my-trip-join-requests?status=all";
  static String acceptJoinRequest({required String id}) =>
      "/trips/join-requests/approve/$id";
  static String rejectJoinRequest({required String id}) =>
      "/trips/join-requests/reject/$id";

  // static String getChatList() => "/chats";
  static String getChatList({int? perPage, String? search}) {
    String endpoint = "/chats";
    Map<String, dynamic> queryParams = {};
    if (perPage != null) queryParams['per_page'] = perPage;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;

    if (queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      endpoint += '?$queryString';
    }
    return endpoint;
  }

  static String createTripConversationId({required String id}) =>
      "/chats/trip/$id";

  // static String clientMeetingDelete(int meetId, int customerId) =>
  //     "/client-meeting-destroy/$meetId?customer_id=$customerId";
  //
  //   static String searchServices({
  //     int? perPage,
  //     String? search,
  //     String? location,
  //     int? categoryId,
  //   }) {
  //     String endpoint = "/services-provider";
  //     Map<String, dynamic> queryParams = {};
  //     if (perPage != null) queryParams['per_page'] = perPage;
  //     if (search != null && search.isNotEmpty) queryParams['search'] = search;
  //     if (location != null) queryParams['location'] = location;
  //     if (categoryId != null) queryParams['category_id'] = categoryId;
  //     if (queryParams.isNotEmpty) {
  //       final queryString = queryParams.entries
  //           .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
  //           .join('&');
  //       endpoint += '?$queryString';
  //     }
  //     return endpoint;
  //   }
}
