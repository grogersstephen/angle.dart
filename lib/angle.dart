import 'dart:math';
import 'package:range/range.dart';

class AngleRange extends Range<Angle> {
  @override
  final Angle a;
  @override
  final Angle b;
  AngleRange(this.a, this.b);

  Angle get mean => Angle(Range.mean(a.radians, b.radians));

  List<Angle> points(int count) =>
      Range.points(a.radians, b.radians, count).map((e) => Angle(e)).toList();
}

class Angle implements Comparable<Angle> {
  final double _radians;

  Angle(double radians) : _radians = radians;
  Angle.radians(double radians) : this(radians);
  Angle.degrees(double degrees) : _radians = inRadians(degrees);

  double get radians => _radians;
  double get inDegrees => _radians * 180 / pi;

  static double inRadians(double degrees) {
    return (degrees * pi) / 180;
  }

  Angle operator +(Angle other) {
    return Angle(other.radians + radians);
  }

  Angle operator -(Angle other) {
    return Angle(other.radians - radians);
  }

  Angle operator *(Angle other) {
    return Angle(other.radians * radians);
  }

  Angle operator /(Angle other) {
    return Angle(other.radians / radians);
  }

  @override
  int compareTo(Angle other) => radians.compareTo(other.radians);

  @override
  String toString() => "Angle(radians: $radians, degrees: $inDegrees)";
}
