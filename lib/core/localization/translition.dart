import 'package:eye_on_palestine/core/localization/ar.dart';
import 'package:eye_on_palestine/core/localization/en.dart';
import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabicKey,
        'en': englishKey,
      };
}
