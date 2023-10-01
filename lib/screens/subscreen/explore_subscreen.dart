import 'package:flutter/material.dart';
import 'package:submission1/data/albums_n_singles.dart';

import '../../components/custom_widgets.dart';

class ExploreOpt {
  IconData icon;
  String text;

  ExploreOpt({required this.icon, required this.text});
}

class ExploreSubscreen extends StatelessWidget {
  List<ExploreOpt> listExplore = [
    ExploreOpt(
      icon: Icons.library_music_outlined,
      text: 'New Releases',
    ),
    ExploreOpt(
      icon: Icons.show_chart_outlined,
      text: 'Charts',
    ),
    ExploreOpt(
      icon: Icons.emoji_emotions_outlined,
      text: 'Moods & Genres',
    ),
  ];

  InkWell newAlbums(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        //  do nothing
      },
      child: Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.only(left: (index == 0) ? 10 : 0),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customImageNetwork(
                imgUrl: listAlbum[index].coverImage,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(10)),
            const SizedBox(
              height: 10,
            ),
            Text(
              listAlbum[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            Text(
              listAlbum[index].artist,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png", width: 60, height: 60,),
        ),
        title: const Text("Agus Music"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: listExplore.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 110,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        listExplore[index].icon,
                        color: Colors.white,
                      ),
                      Text(
                        listExplore[index].text,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                //  image,icon,title, and subtitle
                ListTile(
                  title: Text(
                    "New Albums & Singles",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  trailing: TextButton(
                    child: Text(
                      "More",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),

                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: listAlbum.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return newAlbums(index, context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
