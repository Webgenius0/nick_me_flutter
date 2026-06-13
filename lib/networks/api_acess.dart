import 'package:nick_me/feature/auth/data/rx_login/rx.dart';
import 'package:nick_me/feature/auth/data/rx_logout/rx.dart';
import 'package:nick_me/feature/auth/data/rx_signup/rx.dart';
import 'package:nick_me/feature/auth/data/rx_otp_verify_signup/rx.dart';
import 'package:rxdart/rxdart.dart';

LoginRx getLoginRxObj = LoginRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
LogoutRx getLogoutRxObj = LogoutRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
SignUpRX getSignUpRXObj = SignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
EmailVerifySignUpRx getEmailVerifySignUpRxObj = EmailVerifySignUpRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
  