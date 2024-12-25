import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticsPage extends StatelessWidget {
  const ArticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   height: 200,
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Icon(
          //         Icons.arrow_back_ios_new_outlined,
          //         color: Colors.black,
          //       ),
          //       Icon(
          //         Icons.more_vert,
          //         color: Colors.black,
          //       )
          //     ],
          //   ),
          // )
          Image.asset('assets/images/artics.png'),

          Text('Billie Elish',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 25)),
          Text(
            '2 Album . 67 track',
            style: TextStyle(color: const Color.fromARGB(255, 168, 165, 165)),
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae ',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: const Color.fromARGB(255, 168, 165, 165))),

          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Albums',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )),

          ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              AlbumContainer(),
              AlbumContainer(),
              AlbumContainer(),
            ],
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Songs',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )),

          SizedBox(height: 20.0),
          Playlist(),
          SizedBox(height: 15.0),
          Playlist(),
        ],
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 214, 214),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.black.withOpacity(0.7),
                size: 20.0,
              ),
            ),
            SizedBox(width: 25.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'As It Was',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Harry Styles',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16.0,
                  ),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              '5:33',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 20.0,
              ),
            ),
            SizedBox(width: 30.0),
            Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 25.0,
            )
          ],
        )
      ],
    );
  }
}

class AlbumContainer extends StatelessWidget {
  const AlbumContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 90,
            child: Image.asset(
              'assets/images/album.png',
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 20,
        ),
        Text(
          'Lilbubblegum',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Poppins', fontSize: 25),
        )
      ],
    );
  }
}
