import 'package:challengeproject/views/list_players_view.dart';
import 'package:flutter/material.dart';
import '../entity/entities.dart';
import '../services/crud/player_service.dart';

class StatView extends StatefulWidget {
  const StatView({super.key});

  @override
  State<StatView> createState() => _StatViewState();
}

class _StatViewState extends State<StatView> {
  late final PlayerService _playerService;

  @override
  void initState() {
    _playerService = PlayerService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas dos Jogadores'),
      ),
      body: StreamBuilder(
          stream: _playerService.getPlayers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final allPlayers = snapshot.data as Iterable<Player>;
              return listPlayers(players: allPlayers);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                  ],
                ),
              );
            }
          }),
    );
  }
}
