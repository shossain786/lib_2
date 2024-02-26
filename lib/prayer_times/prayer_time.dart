import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  debugPrint('Kushtia Prayer Times');
  final myCoordinates =
      Coordinates(23.9088, 89.1220); // Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();
  params.madhab = Madhab.hanafi;
  final prayerTimes = PrayerTimes.today(myCoordinates, params);

  debugPrint(
      "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
  debugPrint(DateFormat.jm().format(prayerTimes.fajr));
  debugPrint(DateFormat.jm().format(prayerTimes.sunrise));
  debugPrint(DateFormat.jm().format(prayerTimes.dhuhr));
  debugPrint(DateFormat.jm().format(prayerTimes.asr));
  debugPrint(DateFormat.jm().format(prayerTimes.maghrib));
  debugPrint(DateFormat.jm().format(prayerTimes.isha));

  debugPrint('---');

  // Custom Timezone Usage. (Most of you won't need this).
  debugPrint('NewYork Prayer Times');
  final newYork = Coordinates(35.7750, -78.6336);
  const nyUtcOffset = Duration(hours: -4);
  final nyDate = DateComponents(2015, 7, 12);
  final nyParams = CalculationMethod.north_america.getParameters();
  nyParams.madhab = Madhab.hanafi;
  final nyPrayerTimes =
      PrayerTimes(newYork, nyDate, nyParams, utcOffset: nyUtcOffset);

  debugPrint(nyPrayerTimes.fajr.timeZoneName);
  debugPrint(DateFormat.jm().format(nyPrayerTimes.fajr));
  debugPrint(DateFormat.jm().format(nyPrayerTimes.sunrise));
  debugPrint(DateFormat.jm().format(nyPrayerTimes.dhuhr));
  debugPrint(DateFormat.jm().format(nyPrayerTimes.asr));
  debugPrint(DateFormat.jm().format(nyPrayerTimes.maghrib));
  debugPrint(DateFormat.jm().format(nyPrayerTimes.isha));
}
