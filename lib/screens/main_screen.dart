import 'package:flutter/material.dart';
import 'package:submission1/components/custom_navigator.dart';
import 'package:submission1/components/custom_widgets.dart';
import 'package:submission1/data/songs.dart';
import 'package:submission1/screens/subscreen/download_subscreen.dart';
import 'package:submission1/screens/subscreen/explore_subscreen.dart';
import 'package:submission1/screens/subscreen/home_subscreen.dart';
import 'package:submission1/screens/player_screen.dart';
import 'package:submission1/screens/subscreen/library_subscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Widget> listSubscreen = [
    const HomeSubscreen(),
    ExploreSubscreen(),
    const LibrarySubscreen(),
    const DownloadSubscreen(),
  ];

  List<Map<String, dynamic>> listTabs = [
    {
      "icon_unselected": const Icon(
        Icons.home_outlined,
      ),
      "icon_selected": const Icon(Icons.home),
      "text": "Home"
    },
    {
      "icon_unselected": const Icon(
        Icons.explore_outlined,
      ),
      "icon_selected": const Icon(Icons.explore),
      "text": "Explore"
    },
    {
      "icon_unselected": const Icon(
        Icons.library_music_outlined,
      ),
      "icon_selected": const Icon(Icons.library_music),
      "text": "Libary"
    },
    {
      "icon_unselected": const Icon(
        Icons.download_outlined,
      ),
      "icon_selected": const Icon(Icons.download),
      "text": "Download"
    }
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            listSubscreen.length, (index) => listSubscreen[index]),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade900,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // tidak difungsikan secara sepenuhnya...
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  customPageRoute(
                    page: PlayerScreen(
                      listSongs: listSongs,
                      playingOnIndex: 1,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.only(bottom: 10),
                margin: const EdgeInsets.only(bottom: 20),
                child: ListTile(
                  leading: customImageNetwork(
                      imgUrl:
                          "https://i.ytimg.com/vi/ssfkASaR2Ww/maxresdefault.jpg",
                      width: 50,
                      fit: BoxFit.cover,
                      height: 50),
                  title: Text(
                    "Gospel",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Dr.Dre ft Eminem",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TabBar(
              indicatorWeight: 0.10,
              unselectedLabelColor: Colors.grey.shade200.withOpacity(0.70),
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              controller: _tabController,
              tabs: List.generate(
                listTabs.length,
                (nowIndex) => Tab(
                  icon: (_tabController.index == nowIndex)
                      ? listTabs[nowIndex]['icon_selected'] as Icon
                      : listTabs[nowIndex]['icon_unselected'] as Icon,
                  text: listTabs[nowIndex]['text'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
