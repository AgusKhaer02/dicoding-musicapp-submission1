import 'package:assets_audio_player/assets_audio_player.dart';

List<Audio> listSongs = [
  Audio(
    "assets/songs/billie_eilish_happierthanever.mp3",
    metas: Metas(
      id: '1',
      extra: {"genres": "Rock", "explicit": true},
      title: 'Happier Than Ever',
      artist: 'Billie Eilish',
      album: 'Happier Than Ever',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://media.pitchfork.com/photos/608839f84c67840074db8afb/1:1/w_3000,h_3000,c_limit/Billie-Eilish-Happier-Than-Ever.jpeg'),
    ),
  ),
  Audio(
    "assets/songs/dr.dre_ft_eminem_gospel.mp3",
    metas: Metas(
      id: '2',
      extra: {"genres": "Rap", "explicit": true},
      title: 'Gospel',
      artist: 'Dr.Dre ft Eminem',
      album: 'GTA : The Contract',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://cdns-images.dzcdn.net/images/cover/41638914227d14417f309713a904e741/350x350.jpg'),
    ),
  ),
  Audio(
    "assets/songs/future_ft_drake_lifeisgood.mp3",
    metas: Metas(
      id: '3',
      extra: {"genres": "Rap", "explicit": true},
      title: 'Life is good',
      artist: 'Future ft Drake',
      album: 'GTA : The Contract',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://images.genius.com/917f67e91f8122b9cf66cedf069eb43e.1000x1000x1.png'),
    ),
  ),
  Audio(
    "assets/songs/lauv_heyari.mp3",
    metas: Metas(
      id: '4',
      extra: {"genres": "Pop", "explicit": false},
      title: 'Hey Ari',
      artist: 'Lauv',
      album: 'when i was 17',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://i.scdn.co/image/ab67616d0000b27336b12a4082f11d16a519b964'),
    ),
  ),
  Audio(
    "assets/songs/lauv_ilikemebetter.mp3",
    metas: Metas(
      id: '5',
      extra: {"genres": "Pop", "explicit": false},
      title: 'I like me better',
      artist: 'Lauv',
      album: 'when i was 17',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://i.scdn.co/image/ab67616d0000b27336b12a4082f11d16a519b964'),
    ),
  ),
  Audio(
    "assets/songs/lauv_julia.mp3",
    metas: Metas(
      id: '6',
      extra: {"genres": "Pop", "explicit": false},
      title: 'Julia',
      artist: 'Lauv',
      album: 'when i was 17',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://i.scdn.co/image/ab67616d0000b27336b12a4082f11d16a519b964'),
    ),
  ),
  Audio(
    "assets/songs/lauv_mollyinmexico.mp3",
    metas: Metas(
      id: '7',
      extra: {"genres": "Pop", "explicit": false},
      title: 'Molly In Mexico',
      artist: 'Lauv',
      album: 'when i was 17',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://i.scdn.co/image/ab67616d0000b27336b12a4082f11d16a519b964'),
    ),
  ),
  Audio(
    "assets/songs/tiesto_redlights.mp3",
    metas: Metas(
      id: '8',
      extra: {"genres": "EDM", "explicit": false},
      title: 'Red Lights',
      artist: 'Tiesto',
      album: 'Red Lights',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://cdns-images.dzcdn.net/images/cover/b76482d47ddaad4466f8de588958b56f/500x500.jpg'),
    ),
  ),
  Audio(
    "assets/songs/travis_scott_sicko_mode.mp3",
    metas: Metas(
      id: '9',
      extra: {"genres": "Rap", "explicit": true},
      title: 'Sicko Mode',
      artist: 'Travis Scott ft Drake',
      album: 'Astroworld',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://townsquare.media/site/812/files/2018/08/travis-scott-astroworld-cover-art-full-1.jpg?w=980&q=75'),
    ),
  ),
  Audio(
    "assets/songs/yellowclaw_tillithurts.mp3",
    metas: Metas(
      id: '10',
      extra: {"genres": "EDM", "explicit": false},
      title: 'Till It Hurts',
      artist: 'Yellow Claw ft Aiden',
      album: 'Till It Hurts',
      // image: MetasImage.network('https://www.google.com')
      image: const MetasImage.network(
          'https://i.ytimg.com/vi/yJCtNvr2Htk/maxresdefault.jpg'),
    ),
  ),
];
