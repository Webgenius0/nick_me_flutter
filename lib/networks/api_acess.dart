import 'package:nick_me/feature/auth/data/forget_password/rx.dart';
import 'package:nick_me/feature/auth/data/rx_login/rx.dart';
import 'package:nick_me/feature/auth/data/rx_logout/rx.dart';
import 'package:nick_me/feature/auth/data/rx_resend_otp/rx.dart';
import 'package:nick_me/feature/auth/data/rx_reset_password/rx.dart';
import 'package:nick_me/feature/auth/data/rx_signup/rx.dart';
import 'package:nick_me/feature/auth/data/rx_otp_verify_signup/rx.dart';
import 'package:nick_me/feature/profile/data/rx_profile_data_get/rx.dart';
import 'package:nick_me/feature/profile/data/rx_profile_data_update/rx.dart';
import 'package:nick_me/feature/profile/model/profile_data_get_model.dart';
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
