import 'package:flutter/material.dart';
import 'package:submission1/components/custom_widgets.dart';
import 'package:submission1/components/library_screen/library_types.dart';
import 'package:submission1/data/albums_n_singles.dart';
import 'package:submission1/data/songs.dart';

class LibrarySubscreen extends StatefulWidget {
  const LibrarySubscreen({super.key});

  @override
  State<LibrarySubscreen> createState() => _LibrarySubscreenState();
}

class _LibrarySubscreenState extends State<LibrarySubscreen> {
  List<String> types = [
    "Playlist",
    "Albums",
    "Songs",
    "Artists",
  ];

  List<String> libraries = [];

  fetchArtists() {
    for (var songs in listSongs) {
      var artist = songs.metas.artist;
      libraries.add(artist!);
    }
    Set<String> uniqueArtists = Set<String>.from(libraries);
    List<String> uniqueList = uniqueArtists.toList();
    libraries = uniqueList;
    setState(() {});
  }

  @override
  void initState() {
    fetchArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png", width: 45, height: 45,),
        ),
        title: const Text("Library"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      //         GenreScreen(genre: genres[index])));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 12 : 0),
                      child: LibraryTypes(
                        type: types[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, _) => const SizedBox(
                  width: 10,
                ),
                itemCount: types.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5, left: 15, top: 10),
              child: Text(
                "Recent Activity",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            ...List.generate(
              libraries.length,
              (index) => customCard(
                leading: customImageNetwork(
                    imgUrl:
                        "https://media.istockphoto.com/id/1167753373/vector/woman-avatar-isolated-on-white-background-vector-illustration-for-your-design.jpg?s=612x612&w=0&k=20&c=Y2a_YXRjZ3bXa3Jn2EStSXv7hJly0uEkdlWk4tdbI6U=",
                    shape: CustomShapeImg.circle),
                title: Text(
                  libraries[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  "Artist",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey),
                ),
                onClick: () {},
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
