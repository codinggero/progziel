// import 'dart:math';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MathUtil {
//   static num toRadians(num degrees) => degrees / 180.0 * pi;

//   static num toDegrees(num rad) => rad * (180.0 / pi);

//   static num clamp(num x, num low, num high) =>
//       x < low ? low : (x > high ? high : x);
//   static num wrap(num n, num min, num max) =>
//       (n >= min && n < max) ? n : (mod(n - min, max - min) + min);
//   static num mod(num x, num m) => ((x % m) + m) % m;
//   static num mercator(num lat) => log(tan(lat * 0.5 + pi / 4));
//   static num inverseMercator(num y) => 2 * atan(exp(y)) - pi / 2;
//   static num hav(num x) => sin(x * 0.5) * sin(x * 0.5);
//   static num arcHav(num x) => 2 * asin(sqrt(x));
//   static num sinFromHav(num h) => 2 * sqrt(h * (1 - h));
//   static num havFromSin(num x) => (x * x) / (1 + sqrt(1 - (x * x))) * .5;
//   static num sinSumFromHav(num x, num y) {
//     final a = sqrt(x * (1 - x));
//     final b = sqrt(y * (1 - y));
//     return 2 * (a + b - 2 * (a * y + b * x));
//   }

//   static num havDistance(num lat1, num lat2, num dLng) =>
//       hav(lat1 - lat2) + hav(dLng) * cos(lat1) * cos(lat2);
// }

// class SphericalUtils {
//   static const num earthRadius = 6371009.0;
//   static num computeDistanceBetween(LatLng from, LatLng to) =>
//       computeAngleBetween(from, to) * earthRadius;
//   static num distanceRadians(num lat1, num lng1, num lat2, num lng2) =>
//       MathUtil.arcHav(MathUtil.havDistance(lat1, lat2, lng1 - lng2));
//   static num computeAngleBetween(LatLng from, LatLng to) => distanceRadians(
//       MathUtil.toRadians(from.latitude),
//       MathUtil.toRadians(from.longitude),
//       MathUtil.toRadians(to.latitude),
//       MathUtil.toRadians(to.longitude));
//   static num computeHeading(LatLng from, LatLng to) {
//     final fromLat = MathUtil.toRadians(from.latitude);
//     final fromLng = MathUtil.toRadians(from.longitude);
//     final toLat = MathUtil.toRadians(to.latitude);
//     final toLng = MathUtil.toRadians(to.longitude);
//     final dLng = toLng - fromLng;
//     final heading = atan2(sin(dLng) * cos(toLat),
//         cos(fromLat) * sin(toLat) - sin(fromLat) * cos(toLat) * cos(dLng));

//     return MathUtil.wrap(MathUtil.toDegrees(heading), -180, 180);
//   }

//   static LatLng computeOffset(LatLng from, num distance, num heading) {
//     distance /= earthRadius;
//     heading = MathUtil.toRadians(heading);
//     final fromLat = MathUtil.toRadians(from.latitude);
//     final fromLng = MathUtil.toRadians(from.longitude);
//     final cosDistance = cos(distance);
//     final sinDistance = sin(distance);
//     final sinFromLat = sin(fromLat);
//     final cosFromLat = cos(fromLat);
//     final sinLat =
//         cosDistance * sinFromLat + sinDistance * cosFromLat * cos(heading);
//     final dLng = atan2(sinDistance * cosFromLat * sin(heading),
//         cosDistance - sinFromLat * sinLat);

//     return LatLng(MathUtil.toDegrees(asin(sinLat)).toDouble(),
//         MathUtil.toDegrees(fromLng + dLng).toDouble());
//   }
// }

// class Curved {
//   static List<LatLng> getPointsOnCurve(
//       LatLng startLocation, LatLng endLocation) {
//     List<LatLng> path = [];
//     double angle = pi / 2;
//     double se =
//         SphericalUtils.computeDistanceBetween(startLocation, endLocation)
//             .toDouble();
//     double me = se / 2.0;
//     double R = me / sin(angle / 2);
//     double mo = R * cos(angle / 2);

//     double heading =
//         SphericalUtils.computeHeading(startLocation, endLocation).toDouble();
//     LatLng mCoordinate =
//         SphericalUtils.computeOffset(startLocation, me, heading);

//     double direction =
//         (startLocation.longitude - endLocation.longitude > 0) ? -1.0 : 1.0;
//     double angleFromCenter = 90.0 * direction;
//     LatLng oCoordinate = SphericalUtils.computeOffset(
//         mCoordinate, mo, heading + angleFromCenter);

//     path.add(endLocation);

//     int num = 100;

//     double initialHeading =
//         SphericalUtils.computeHeading(oCoordinate, endLocation).toDouble();
//     double degree = (180.0 * angle) / pi;

//     for (int i = 1; i <= num; i++) {
//       double step = i.toDouble() * (degree / num.toDouble());
//       double heading = (-1.0) * direction;
//       LatLng pointOnCurvedLine = SphericalUtils.computeOffset(
//           oCoordinate, R, initialHeading + heading * step);
//       path.add(pointOnCurvedLine);
//     }

//     path.add(startLocation);

//     return path;
//   }
// }
