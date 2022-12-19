import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

@immutable
class Player {
  final String? docId;
  final String name;
  final int points;
  final int assists;
  final int rebounds;

  const Player({
    this.docId,
    required this.name,
    required this.points,
    required this.assists,
    required this.rebounds,
  });

  Player.fromRow(Map<String, Object?> map, this.docId)
      : name = map['name'] as String,
        points = map['points'] as int,
        assists = map['assists'] as int,
        rebounds = map['rebounds'] as int;

  Player.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot, this.docId)
      : name = snapshot.data()['name'] as String,
        points = snapshot.data()['points'] as int,
        assists = snapshot.data()['assists'] as int,
        rebounds = snapshot.data()['rebounds'] as int;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'points': points,
      'assists': assists,
      'rebounds': rebounds,
    };
  }

  @override
  String toString() {
    return 'Player{name: $name, points: $points, assists: $assists, rebounds: $rebounds}';
  }
}
