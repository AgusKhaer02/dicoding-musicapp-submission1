import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class LibraryTypes extends StatelessWidget {
  final String type;
  const LibraryTypes({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(0.10),
      ),
      child: Center(
        child: Text(
          type,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
