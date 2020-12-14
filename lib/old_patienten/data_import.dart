import 'package:flutter/foundation.dart';

class UserData {
  final String id;
  final String location;
  final double variationcoefficient;
  final double averagestiffness;
  final double averageimprintdeepness;
  final double stiffnestfirstindentation;
  final double stiffnesssecondindentation;
  final double time;
  final double increaseofforcepersecond;
  final DateTime date;

  UserData({
    @required this.id,
    @required this.location,
    @required this.variationcoefficient,
    @required this.averagestiffness,
    @required this.averageimprintdeepness,
    @required this.stiffnestfirstindentation,
    @required this.stiffnesssecondindentation,
    @required this.time,
    @required this.increaseofforcepersecond,
    @required this.date,
  });
}
