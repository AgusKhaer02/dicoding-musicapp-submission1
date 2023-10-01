import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:submission1/data/songs.dart';

class Playlist {
  final String coverImage;
  final String title;
  final List<Audio> listSongs;

  Playlist(
      {required this.title, required this.coverImage, required this.listSongs});
}

List<Playlist> listPlaylist = [
  Playlist(
    coverImage:
        "https://www.lswgcpa.com/wp-content/uploads/2022/02/20220303-SunriseJump-pexels-jill-wellington-40815.jpg.webp",
    title: 'Energize',
    listSongs: [
      listSongs[1],
      listSongs[6],
      listSongs[2],
      listSongs[8],
      listSongs[9],
    ],
  ),
  Playlist(
    coverImage:
        "https://media.istockphoto.com/id/1308753258/photo/loneliness-teenage-girls.jpg?s=612x612&w=0&k=20&c=BwUA2BhpFCaFkbDiuq3AZ-VU7NsEiNhqY-xQkDTovro=",
    title: 'Sad',
    listSongs: [
      listSongs[0],
      listSongs[3],
      listSongs[5],
    ],
  ),
  Playlist(
    coverImage:
        "https://bloximages.chicago2.vip.townnews.com/pantagraph.com/content/tncms/assets/v3/editorial/f/fc/ffcb41a7-04f8-5410-b1c1-e152a88ee44e/64e504a68b4f9.image.jpg",
    title: 'Workout',
    listSongs: [
      listSongs[6],
      listSongs[7],
      listSongs[9],
    ],
  ),
  Playlist(
    coverImage:
        "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202102/couple-915991_1920_1200x768.jpeg?size=690:388",
    title: 'Love',
    listSongs: [
      listSongs[4],
      listSongs[5],
    ],
  ),
];
