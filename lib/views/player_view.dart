import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../entity/entities.dart';
import '../firebase_options.dart';
import '../services/crud/player_service.dart';

const saveAlert = AlertDialog(
  title: Text('Estatística de Jogador Registrada!'),
  content: Text('A estatística do jogador foi registrada com sucesso!'),
);

class PlayerView extends StatefulWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  late final PlayerService _playerService;
  late final TextEditingController _playerNameController;
  late final TextEditingController _playerPointsController;
  late final TextEditingController _playerAssistsController;
  late final TextEditingController _playerReboundsController;

  @override
  void initState() {
    _playerService = PlayerService();
    _playerNameController = TextEditingController();
    _playerPointsController = TextEditingController();
    _playerAssistsController = TextEditingController();
    _playerReboundsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _playerNameController.dispose();
    _playerPointsController.dispose();
    _playerAssistsController.dispose();
    _playerReboundsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Registration'),
      ),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                textAlign: TextAlign.center,
                controller: _playerNameController,
                decoration: const InputDecoration(
                  hintText: 'Nome',
                ),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _playerPointsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Pontos',
                  )),
              TextField(
                textAlign: TextAlign.center,
                controller: _playerAssistsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Assistências',
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _playerReboundsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Rebotes',
                ),
              ),
              TextButton(
                  onPressed: () async {
                    try {
                      final playerName = _playerNameController.text;
                      final playerPoints = _playerPointsController.text;
                      final playerAssists = _playerAssistsController.text;
                      final playerRebounds = _playerReboundsController.text;
                      final player = Player(
                        name: playerName,
                        points: int.parse(playerPoints),
                        assists: int.parse(playerAssists),
                        rebounds: int.parse(playerRebounds),
                      );
                      await _playerService.insertPlayer(player.toJson());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Estatística salva com sucesso!'),
                        ),
                      );
                    } catch (e) {
                      throw Exception(e);
                    }
                  },
                  child: const Text("Salvar"))
            ],
          );
          return const CircularProgressIndicator();
        }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
