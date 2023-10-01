import 'package:flutter/material.dart';
import 'package:submission1/components/custom_navigator.dart';
import 'package:submission1/components/custom_widgets.dart';
import 'package:submission1/components/home_subscreen/category_song.dart';
import 'package:submission1/data/playlists.dart';
import 'package:submission1/data/songs.dart';
import 'package:submission1/screens/genre_screen.dart';
import 'package:submission1/screens/player_screen.dart';
import 'package:submission1/screens/playlists_screen.dart';

class HomeSubscreen extends StatefulWidget {
  const HomeSubscreen({Key? key}) : super(key: key);

  @override
  State<HomeSubscreen> createState() => _HomeSubscreenState();
}

class _HomeSubscreenState extends State<HomeSubscreen> {
  List<String> genres = [];

  fetchGenres() {
    for (var songs in listSongs) {
      var metas = songs.metas.extra!['genres'];
      genres.add(metas);
    }
    Set<String> uniqueGenres = Set<String>.from(genres);
    List<String> uniqueList = uniqueGenres.toList();
    genres = uniqueList;
    setState(() {});
  }

  @override
  void initState() {
    fetchGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png"),
        ),
        title: const Text("Agus Music"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Colors.black,
              Colors.black,
              Colors.grey.shade900,
              Colors.black,
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                transform: const GradientRotation(90))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // genres
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                GenreScreen(genre: genres[index])));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: (index == 0) ? 12 : 0),
                        child: CategorySong(category: genres[index]),
                      ),
                    );
                  },
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: genres.length,
                ),
              ),
              // fav songs
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    //  image,icon,title, and subtitle
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/35357971?v=4'),
                      ),
                      title: Text(
                        "AGUS KURNIADIN KHAER",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                      subtitle: Text(
                        "Your Favorite",
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
                      height: 320,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listSongs.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                childAspectRatio: 4 / 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(customPageRoute(
                                page: PlayerScreen(
                                  listSongs: listSongs,
                                  playingOnIndex: index,
                                ),
                              ));
                            },
                            child: GridTile(
                              child: Container(
                                width: 150,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customImageNetwork(
                                        imgUrl:
                                            listSongs[index].metas.image!.path,
                                        width: double.infinity,
                                        height: 110,
                                        fit: BoxFit.cover,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        (listSongs[index]
                                                    .metas
                                                    .extra!['explicit'] ==
                                                true)
                                            ? explicitLabel(context: context)
                                            : const SizedBox(),
                                        Expanded(
                                          child: Text(
                                            listSongs[index].metas.title!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //  suggested playlist
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    //  image,icon,title, and subtitle
                    ListTile(
                      title: Text(
                        "Recommended Playlists",
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
                        itemCount: listPlaylist.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return playlistItem(index, context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell playlistItem(int index, BuildContext context) {
    List<String> theseGenres = [];
    List<String> theseArtists = [];

    for (var song in listPlaylist[index].listSongs) {
      theseArtists.add(song.metas.artist!);
      theseGenres.add(song.metas.extra!['genres']);
    }
    String genres = theseGenres.toSet().join(", ");
    String artists = theseArtists.toSet().join(", ");

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlaylistsScreen(
                  playlist: listPlaylist[index],
                )));
      },
      child: Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.only(left: (index == 0) ? 10 : 0),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                customImageNetwork(
                    imgUrl: listPlaylist[index].coverImage,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(10)),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )),
                ),
                Positioned(
                  bottom: 10,
                  left: 5,
                  child: Text(
                    listPlaylist[index].title,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              genres,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            Text(
              artists,
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
}
