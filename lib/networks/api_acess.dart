import 'package:nick_me/feature/auth/data/forget_password/rx.dart';
import 'package:nick_me/feature/auth/data/rx_login/rx.dart';
import 'package:nick_me/feature/auth/data/rx_logout/rx.dart';
import 'package:nick_me/feature/auth/data/rx_resend_otp/rx.dart';
import 'package:nick_me/feature/auth/data/rx_reset_password/rx.dart';
import 'package:nick_me/feature/auth/data/rx_signup/rx.dart';
import 'package:nick_me/feature/auth/data/rx_otp_verify_signup/rx.dart';
import 'package:nick_me/feature/profile/data/rx_change_password/rx.dart';
import 'package:nick_me/feature/profile/data/rx_privacy_policy/rx.dart';
import 'package:nick_me/feature/profile/data/rx_profile_data_get/rx.dart';
import 'package:nick_me/feature/profile/data/rx_profile_data_update/rx.dart';
import 'package:nick_me/feature/profile/data/rx_terms_condition/rx.dart';
import 'package:nick_me/feature/profile/model/privacy_policy_model.dart';
import 'package:nick_me/feature/profile/model/profile_data_get_model.dart';
import 'package:nick_me/feature/profile/model/terms_and_contitions.dart';
import 'package:rxdart/rxdart.dart';

LoginRx getLoginRxObj = LoginRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
LogoutRx getLogoutRxObj = LogoutRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
SignUpRX getSignUpRXObj = SignUpRX(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
EmailVerifySignUpRx getEmailVerifySignUpRxObj = EmailVerifySignUpRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
ForgetPasswodRx getForgetPasswodRxObj = ForgetPasswodRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
ResetPassRX getResetPassRXObj = ResetPassRX(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
ResendOtpRx getResendOtpRxObj = ResendOtpRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);

ProfileDataRX getProfileDataRXObj = ProfileDataRX(
  empty: ProfileDataGetModel(),
  dataFetcher: BehaviorSubject<ProfileDataGetModel>(),
);
UpdateProfileRx getUpdateProfileRxObj = UpdateProfileRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
ChangePassRX getChangePassRXObj = ChangePassRX(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);

TermsAndConditionRX getTermsAndConditionRXObj = TermsAndConditionRX(
  empty: TermsPrivacyPolicyModel(),
  dataFetcher: BehaviorSubject<TermsPrivacyPolicyModel>(),
);

PrivacyPolicyRX getPrivacyPolicyRXObj = PrivacyPolicyRX(
  empty: PrivacyPolicyModel(),
  dataFetcher: BehaviorSubject<PrivacyPolicyModel>(),
);
