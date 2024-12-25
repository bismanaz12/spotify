import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white54,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    )),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage(''),
                radius: 27,
              ),
              Text(
                'email',
                style: TextStyle(
                    color: const Color.fromARGB(255, 181, 176, 176),
                    fontFamily: 'Poppins'),
              ),
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '230',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Followes',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '230',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Followes',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Text(
          'Public Playlist',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Playlist(),
            SizedBox(
              height: 10,
            ),
            Playlist(),
            SizedBox(
              height: 10,
            ),
            Playlist(),
            SizedBox(
              height: 10,
            ),
            Playlist()
          ],
        )
      ],
    ));
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
              height: 35,
              child: Image.asset(
                'assets/images/album.png',
                fit: BoxFit.cover,
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
              Icons.more_horiz,
              color: Colors.grey,
              size: 25.0,
            )
          ],
        )
      ],
    );
  }
}
