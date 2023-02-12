import 'package:flutter/material.dart';

import 'package:fun_with_kanji/models/radical.dart';
import 'package:fun_with_kanji/models/script_loader.dart';

class RadicalsViewer extends StatelessWidget {
  final int level;
  const RadicalsViewer({required this.level, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radicals'),
      ),
      body: FutureBuilder<List<Radical>>(
        future: ScriptLoader.loadRadicals(context, level),
        builder: (context, snapshot) {
          final radicals = snapshot.data;
          if (radicals == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.builder(
            itemCount: radicals.length,
            itemBuilder: (context, i) => ListTile(
              leading: CircleAvatar(
                foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(radicals[i].radical),
                  ),
                ),
              ),
              title: Text(radicals[i].name),
              subtitle: Text(radicals[i].reading),
            ),
          );
        },
      ),
    );
  }
}
