import 'dart:ui';
import 'package:submission1/components/custom_navigator.dart';
import 'package:submission1/components/custom_widgets.dart';
import 'package:submission1/data/playlists.dart' as my_playlists;
import 'package:flutter/material.dart';
import 'package:submission1/screens/player_screen.dart';

class PlaylistsScreen extends StatelessWidget {
  final my_playlists.Playlist playlist;

  const PlaylistsScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(playlist.title),
      ),
      body: Stack(
        children: [
          Image.network(playlist.coverImage),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                customImageNetwork(
                    imgUrl: playlist.coverImage,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  playlist.title,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade900),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            customPageRoute(
                              page: PlayerScreen(
                                  listSongs: playlist.listSongs,
                                  playingOnIndex: 0),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shuffle_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            customPageRoute(
                              page: PlayerScreen(
                                  listSongs: playlist.listSongs,
                                  playingOnIndex: 0),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade900),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            customPageRoute(
                              page: PlayerScreen(
                                  listSongs: playlist.listSongs,
                                  playingOnIndex: 0),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.black,
                  child: Column(
                      children:
                          List.generate(playlist.listSongs.length, (index) {
                    var metas = playlist.listSongs[index].metas;
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
                      onClick: () {
                        Navigator.of(context).push(
                          customPageRoute(
                            page: PlayerScreen(
                                listSongs: playlist.listSongs,
                                playingOnIndex: index),
                          ),
                        );
                      },
                    );
                  }).toList()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
