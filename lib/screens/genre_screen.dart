import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:submission1/components/custom_navigator.dart';
import 'package:submission1/screens/player_screen.dart';

import '../components/custom_widgets.dart';
import '../data/songs.dart';

class GenreScreen extends StatefulWidget {
  final String genre;
  const GenreScreen({super.key, required this.genre});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Audio> songs = [];

  getSongs() {
    songs = listSongs.where((song) {
      return song.metas.extra != null &&
          song.metas.extra!['genres'] != null &&
          song.metas.extra!['genres'].toLowerCase() ==
              widget.genre.toLowerCase();
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.genre),
      ),
      body: Stack(
        children: [
          Image.network(
              "https://musicandbands.co.uk/sites/default/files/styles/large/public/2022-05/Music%20Genre%20Second%20Hero.jpg?itok=40x_7UnO"),
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
                    imgUrl:
                        "https://musicandbands.co.uk/sites/default/files/styles/large/public/2022-05/Music%20Genre%20Second%20Hero.jpg?itok=40x_7UnO",
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.genre,
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
                                  listSongs: songs, playingOnIndex: 0),
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
                                  listSongs: songs, playingOnIndex: 0),
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
                                  listSongs: songs, playingOnIndex: 0),
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
                      children: List.generate(songs.length, (index) {
                    var metas = songs[index].metas;
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
                                listSongs: songs, playingOnIndex: index),
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
