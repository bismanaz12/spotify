import 'package:flutter/material.dart';
import 'package:spotify/cons/model.dart';

class PlayScreen extends StatefulWidget {
  final TrackSongs track;

  const PlayScreen({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  bool isPlaying = false;
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: const Text(
            'Now Playing',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildAlbumArt(),
              const SizedBox(height: 30),
              _buildSongInfo(),
              const SizedBox(height: 30),
              _buildProgressBar(),
              const SizedBox(height: 30),
              _buildControls(),
              const SizedBox(height: 50),
              _buildBottomControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumArt() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/images/video.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSongInfo() {
    return Column(
      children: [
        Text(
          widget.track.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.track.artists.join(", "),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.7),
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
            activeTrackColor: const Color(0xff42C83C),
            inactiveTrackColor: Colors.grey.shade200,
            thumbColor: const Color(0xff42C83C),
            overlayColor: const Color(0xff42C83C).withOpacity(0.2),
          ),
          child: Slider(
            value: _currentValue,
            max: 100,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(_currentValue),
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                '3:30',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.shuffle),
          color: Colors.grey,
          iconSize: 25,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.skip_previous),
          color: Colors.black,
          iconSize: 35,
          onPressed: () {},
        ),
        Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: Color(0xff42C83C),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isPlaying = !isPlaying;
              });
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          color: Colors.black,
          iconSize: 35,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.repeat),
          color: Colors.grey,
          iconSize: 25,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.devices),
          color: Colors.grey,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.volume_up),
          color: Colors.grey,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.share),
          color: Colors.grey,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          color: Colors.grey,
          onPressed: () {},
        ),
      ],
    );
  }

  String _formatDuration(double value) {
    final duration = Duration(seconds: (value * 3.3).round());
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

// Modify your TrackListItem to include navigation
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayScreen(track: track),
          ),
        );
      },
      child: Container(
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      builder: (context) => PlayScreen(track: track),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
