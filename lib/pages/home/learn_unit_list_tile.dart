import 'package:flutter/material.dart';

class LeanUnitListTile extends StatelessWidget {
  final int? progress;
  final String title;
  final void Function() onTap;
  final void Function() onSettings;
  final String symbol;

  const LeanUnitListTile({
    required this.progress,
    required this.title,
    required this.symbol,
    required this.onTap,
    required this.onSettings,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_right_outlined),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Text(
                      symbol,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Material(
                      borderRadius: BorderRadius.circular(64),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 64,
                            height: 64,
                            child: CircularProgressIndicator(
                              value: (progress ?? 0) / 100,
                              color: Colors.green,
                            ),
                          ),
                          if (progress != null)
                            Center(
                                child: Text(
                              '$progress%',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Material(
                      borderRadius: BorderRadius.circular(64),
                      child: IconButton(
                        icon: const Icon(Icons.settings_outlined),
                        onPressed: onSettings,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
