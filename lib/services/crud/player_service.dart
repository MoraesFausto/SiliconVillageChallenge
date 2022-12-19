import 'dart:async';

import 'package:challengeproject/entity/entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerService {
  static const _tableName = 'players';
  final players = FirebaseFirestore.instance.collection(_tableName);

  Future<void> deletePlayer(String id) async {
    try {
      await players.doc(id).delete();
    } catch (e) {
      throw Exception('Erro ao deletar jogador: $e');
    }
  }

  Future<void> insertPlayer(Map<String, Object?> player) async {
    try {
      await players.add(player);
    } catch (e) {
      throw Exception('Erro ao inserir jogador: $e');
    }
  }

  Stream<Iterable<Player>> getPlayers() {
    final playersList = players
        .snapshots()
        .map((event) => event.docs.map((e) => Player.fromSnapshot(e, e.id)));
    return playersList;
  }
}
