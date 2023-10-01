import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:submission1/components/custom_widgets.dart';
import 'package:submission1/data/songs.dart';

class PlayerScreen extends StatefulWidget {
  final List<Audio> listSongs;
  final int playingOnIndex;

  const PlayerScreen(
      {super.key, required this.listSongs, required this.playingOnIndex});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  int nowIndex = 0;
  late Metas metasSong;
  bool isLooping = false;

  openSong({required int index}) {
    try {
      audioPlayer.open(widget.listSongs[index]);
    } on Exception catch (err) {
      if (kDebugMode) {
        print("err init song : $err");
      }
    }
  }

  initSong({required int index}) {
    openSong(index: index);
  }

  setMetas() {
    metasSong = widget.listSongs[nowIndex].metas;
  }

  nextSong() {
    if (widget.listSongs.length > nowIndex + 1) {
      nowIndex++;
      audioPlayer.stop();
      setState(() {
        initSong(index: nowIndex);
        metasSong = widget.listSongs[nowIndex].metas;
      });
    } else {
      const snackBar = SnackBar(
        content: Text(
          'End of Playlist!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  prevSong() {
    if (nowIndex - 1 >= 0) {
      nowIndex--;
      audioPlayer.stop();
      setState(() {
        initSong(index: nowIndex);
        metasSong = widget.listSongs[nowIndex].metas;
      });
    } else {
      const snackBar = SnackBar(
        content: Text(
          'End of Playlist!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  loop() {
    audioPlayer.toggleLoop();
  }

  shuffle() {
    var random = Random();
    int randomNumber = random.nextInt(listSongs.length - 1);
    nowIndex = randomNumber;
    audioPlayer.stop();
    setState(() {
      initSong(index: nowIndex);
      metasSong = widget.listSongs[nowIndex].metas;
    });
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  double durationToDouble({required String input}) {
    String firstHalf = input.substring(0, input.indexOf(':'));
    String secHalf = input.substring(input.indexOf(':') + 1);

    int hour = int.parse(firstHalf);
    int min = int.parse(secHalf);

    double output = hour + min / 60;
    return output;
  }

  isFinished() async {
    audioPlayer.onReadyToPlay.listen((event) {
      audioPlayer.currentPosition.listen((position) {
        if (audioPlayer.current.value != null) {
          var currentAudio =
              audioPlayer.current.value!.audio.duration.inMilliseconds - 100;
          var now = position.inMilliseconds;
          if (now >= (currentAudio) && currentAudio != 0) {
            if (audioPlayer.currentLoopMode == LoopMode.none) {
              nextSong();
            }
          }
        }
      });
    });
  }

  @override
  void initState() {
    nowIndex = widget.playingOnIndex;
    initSong(index: nowIndex);
    setMetas();
    isFinished();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.expand_more_outlined),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 100),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: customImageNetwork(
                    imgUrl: metasSong.image!.path, fit: BoxFit.cover)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 20, right: 15),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        metasSong.title!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      metasSong.artist!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: audioPlayer.onReadyToPlay,
                    builder: (context, value) {
                      if (value.hasData) {
                        Duration musicNowDuration =
                            audioPlayer.current.value!.audio.duration;
                        final playerState = value.data;

                        if (playerState?.duration != null) {
                          return PlayerBuilder.currentPosition(
                              player: audioPlayer,
                              builder: (context, duration) {
                                return Slider(
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.grey,
                                  thumbColor: Colors.grey.shade300,
                                  value: duration.inSeconds.toDouble(),
                                  onChanged: (value) {
                                    Duration seekDuration =
                                        Duration(seconds: value.toInt());

                                    audioPlayer.seek(seekDuration);
                                  },
                                  min: const Duration(seconds: 0)
                                      .inSeconds
                                      .toDouble(),
                                  max: musicNowDuration.inSeconds.toDouble(),
                                );
                              });
                        }
                        return Slider(
                          value: 0,
                          onChanged: (value) {
                            Duration seekDuration =
                                Duration(seconds: value.toInt());

                            audioPlayer.seek(seekDuration);
                          },
                          min: const Duration(seconds: 0).inSeconds.toDouble(),
                          max: musicNowDuration.inSeconds.toDouble(),
                        );
                      }
                      return const SizedBox();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        shuffle();
                      },
                      icon: const Icon(
                        Icons.shuffle,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        prevSong();
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: StreamBuilder(
                          stream: audioPlayer.isPlaying,
                          builder: (BuildContext context, play) {
                            if (play.data!) {
                              return IconButton(
                                onPressed: () {
                                  audioPlayer.pause();
                                },
                                icon: const Icon(
                                  Icons.pause,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              );
                            }

                            return IconButton(
                              onPressed: () {
                                audioPlayer.play();
                              },
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 40,
                              ),
                            );
                          },
                        )),
                    IconButton(
                      onPressed: () {
                        nextSong();
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        loop();
                      },
                      icon: StreamBuilder(
                          stream: audioPlayer.loopMode,
                          builder: (context, snapshot) {
                            if (snapshot.data == LoopMode.single) {
                              return const Icon(
                                Icons.repeat,
                                color: Colors.white,
                                size: 25,
                              );
                            }
                            return const Icon(
                              Icons.repeat,
                              color: Colors.grey,
                              size: 25,
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
