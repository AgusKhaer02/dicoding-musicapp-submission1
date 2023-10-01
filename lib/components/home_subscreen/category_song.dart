import 'package:flutter/material.dart';

class CategorySong extends StatelessWidget {
  final String category;
  const CategorySong({Key? key, required this.category}) : super(key: key);

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
          category,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
