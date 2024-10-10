import 'package:eagle_valet_parking_mobile/core/utils/translate.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

class TimeRepo {
  String formatDuration(Duration duration) {
    dynamic hours =
        duration.inHours.remainder(24); // remaining hours after taking out days
    dynamic minutes = duration.inMinutes.remainder(60);

    if (Intl.getCurrentLocale() == "ar") {
      hours = Translate().translateNumberToArabic(hours.toString());
      minutes = Translate().translateNumberToArabic(minutes.toString());
    } // remaining minutes after taking out hours
    return "$hours ${S.current.hours}  $minutes ${S.current.minutes}";
  }
}
