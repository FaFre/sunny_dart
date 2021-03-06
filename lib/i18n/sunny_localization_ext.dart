import 'package:timezone/timezone.dart';
import 'sunny_localization.dart';

extension SunnyLocalizationExt on Future<SunnyLocalization> {
  Future<TimeZone> get userTimeZone => then((_) => _.userTimeZone);
  Future<Location> get userLocation => then((_) => _.userLocation);
}

extension LocalizationDateTimeExt on DateTime {
  TZDateTime withTimeZone([Location location]) {
    assert(location != null);
    if (this is TZDateTime) return (this as TZDateTime);
    return TZDateTime.from(this, location ?? sunnyLocalization.userLocation);
  }
}

Location locationOf(name) {
  return sunnyLocalization.locationOf(name?.toString());
}

TimeZone timeZoneOf(name) {
  return sunnyLocalization.timeZoneOf(name?.toString());
}
