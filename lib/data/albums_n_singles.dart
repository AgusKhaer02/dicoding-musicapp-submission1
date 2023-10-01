import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:submission1/data/songs.dart';

class Albums {
  final String coverImage;
  final String title;
  final String artist;
  final List<Audio> listSongs;

  Albums(
      {required this.artist,
      required this.title,
      required this.coverImage,
      required this.listSongs});
}

List<Albums> listAlbum = [
  Albums(
    coverImage:
        "https://cdns-images.dzcdn.net/images/cover/41638914227d14417f309713a904e741/350x350.jpg",
    title: '(OST)GTA Online : The Contract',
    artist: 'Dr Dre',
    listSongs: [
      listSongs[1],
    ],
  ),
  Albums(
    coverImage:
        "https://upload.wikimedia.org/wikipedia/en/4/45/Lauv_-_How_I%27m_Feeling.png",
    title: 'How I\'m Feeling',
    artist: 'Lauv',
    listSongs: [
      listSongs[4],
      listSongs[5],
    ],
  ),
];
