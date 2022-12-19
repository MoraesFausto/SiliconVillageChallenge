import 'package:challengeproject/services/crud/player_service.dart';
import 'package:flutter/material.dart';
import '../constants/por_extenso.dart';
import '../entity/entities.dart';

typedef PlayerCallback = void Function(Player player);

class listPlayers extends StatelessWidget {
  final Iterable<Player> players;
  final PlayerService _servicePlayer = PlayerService();

  listPlayers({
    Key? key,
    required this.players,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players.elementAt(index);
        return ListTile(
          title: Text(player.name),
          subtitle: Column(
            children: [
              Text(
                  "${porExtenso[player.points]} pontos\n${porExtenso[player.assists]} assistencias\n${porExtenso[player.rebounds]} rebotes"),
              ElevatedButton(
                onPressed: () async {
                  await _servicePlayer.deletePlayer(player.docId.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Jogador deletado com sucesso!'),
                    ),
                  );
                },
                child: const Text("Deletar"),
              ),
            ],
          ),

          //    onTap: () => onPlayerSelected(player),
        );
      },
    );
  }
}
