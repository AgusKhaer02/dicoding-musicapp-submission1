import 'package:flutter/material.dart';
import 'package:submission1/data/songs.dart';

import '../../components/custom_widgets.dart';

class DownloadSubscreen extends StatelessWidget {
  const DownloadSubscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png", width: 60, height: 60,),
        ),
        title: const Text("Downloads"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5, left: 15, top: 10),
              child: Text(
                "Downloads",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            ...List.generate(3, (index) {
              var metas = listSongs[index].metas;
              return customCard(
                leading: customImageNetwork(
                    imgUrl: metas.image!.path,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover),
                title: Text(
                  metas.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  "${metas.artist}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey.shade200),
                ),
                onClick: () {},
              );
            }).toList(),
            Container(
              margin: const EdgeInsets.only(bottom: 5, left: 15, top: 10),
              child: Text(
                "Suggested Downloads",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            ...List.generate(listSongs.length, (index) {
              var metas = listSongs[index].metas;
              return customCard(
                leading: customImageNetwork(
                    imgUrl: metas.image!.path,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover),
                title: Text(
                  metas.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  "${metas.artist}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey.shade200),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download_outlined),
                ),
                onClick: () {},
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
