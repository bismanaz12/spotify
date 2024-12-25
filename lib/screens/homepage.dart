import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/cons/model.dart';
import 'package:spotify/cons/playlist.dart';
import 'package:spotify/cons/provider.dart';
import 'package:spotify/cons/token.dart';
import 'package:spotify/screens/playscreen.dart';
// Import the chatGptPlay function
// Adjust this import based on where your chatGptPlay function is

class TokenProvider with ChangeNotifier {
  String? _accessToken;
  bool _isLoading = false;

  String? get accessToken => _accessToken;
  bool get isLoading => _isLoading;

  Future<void> fetchToken(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Your token fetching logic here
      // final String token = 'your_token_here';
      // _accessToken = token;
      String token = await getToken(context);

      // After getting the token, fetch the tracks
      await chatGptPlay(token, context);
    } catch (e) {
      print('Error getting token: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }

  Future<void> _initializeData() async {
    if (!mounted) return;
    final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
    await tokenProvider.fetchToken(context);
  }

  Future<void> _refreshTracks() async {
    if (!mounted) return;
    await _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshTracks,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Consumer2<TokenProvider, TracksProvider>(
              builder: (context, tokenProvider, tracksProvider, child) {
                if (tokenProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff42C83C),
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      _buildHeader(),
                      const SizedBox(height: 20.0),
                      _buildFeaturedAlbum(),
                      const SizedBox(height: 20.0),
                      CustomTabBar(),
                      const SizedBox(height: 20.0),
                      _buildVideoSection(),
                      const SizedBox(height: 20.0),
                      _buildTracksList(tracksProvider),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Videos',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          height: 300.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              VideoContainer(
                txt1: 'Bad Guy',
                txt2: 'Billie Eilish',
                image: 'assets/images/video.png',
              ),
              VideoContainer(
                txt1: 'Dark Night',
                txt2: 'Billie Eilish',
                image: 'assets/images/video1.png',
              ),
              VideoContainer(
                txt1: 'Scorpion',
                txt2: 'Drake',
                image: 'assets/images/video.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTracksList(TracksProvider tracksProvider) {
    if (tracksProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xff42C83C),
        ),
      );
    }

    if (tracksProvider.tracks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'No tracks available',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _refreshTracks,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff42C83C),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Refresh Tracks',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Songs',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tracksProvider.tracks.length,
          itemBuilder: (context, index) {
            final track = tracksProvider.tracks[index];
            return TrackListItem(
              track: track,
              index: index + 1,
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.search, size: 35.0, color: Colors.black),
        SizedBox(
          height: 40.0,
          child: Image.asset(
            'assets/images/spotify.png',
            fit: BoxFit.contain,
          ),
        ),
        const Icon(Icons.more_vert, color: Colors.grey, size: 35.0),
      ],
    );
  }

  Widget _buildFeaturedAlbum() {
    return Stack(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff42C83C),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Album',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Happier Than Ever',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Billie Eilish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/girl.png',
            height: 200.0,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class TrackListItem extends StatelessWidget {
  final TrackSongs track;
  final int index;

  const TrackListItem({
    Key? key,
    required this.track,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xff42C83C).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Color(0xff42C83C),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        title: Text(
          track.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          track.artists.join(", "),
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
            fontFamily: 'Poppins',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.play_circle_filled,
                color: Color(0xff42C83C),
                size: 32,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayScreen(track: track)));
                print("Playing: ${track.name}");
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              onPressed: () {
                print("Favorite: ${track.name}");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: [
        _buildTab('News', 0),
        _buildTab('Videos', 1),
        _buildTab('Artists', 2),
        _buildTab('Podcasts', 3),
      ],
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
    );
  }

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: _tabController.index == index ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class VideoContainer extends StatelessWidget {
  final String txt1;
  final String txt2;
  final String image;

  const VideoContainer({
    Key? key,
    required this.txt1,
    required this.txt2,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200.0,
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  height: 220.0,
                  width: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                txt1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              Text(
                txt2,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          right: 38.0,
          bottom: 69.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 217, 214, 214),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(7.0),
            child: Icon(
              Icons.play_arrow,
              color: Colors.black.withOpacity(0.7),
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
