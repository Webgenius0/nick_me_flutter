import 'package:hive/hive.dart';
import '../constants/update_customer.dart';
import '../helpers/di.dart';

Future<void> totalDataClean() async {
  await appData.write(kKeyIsLoggedIn, false);
  await appData.write(kKeyIsExploring, false);
  appData.write(kKeyLanguage, kKeyPortuguese);
  appData.write(kKeyCountryCode, countriesCode[kKeyPortuguese]);
  appData.write(kKeySelectedLocation, false);

  try {
    var verificationBox = await Hive.openBox('verificationCache');
    await verificationBox.clear();
    var chatBox = await Hive.openBox('chatCache');
    await chatBox.clear();
  } catch (e) {
    // ignore
  }

  //lisbon
  // appData.writeIfNull(kKeySelectedLat, 38.74631383626653);
  // appData.writeIfNull(kKeySelectedLng, -9.130169921874991);
  //codemen
  await appData.write(kKeySelectedLat, 22.818285677915657);
  await appData.write(kKeySelectedLng, 89.5535583794117);
}

// void cleanLoginData() {
//   signinRXobj.clean();
//   getProfileRXobj.clean();
//   viewOrderRXobj.clean();
// }
