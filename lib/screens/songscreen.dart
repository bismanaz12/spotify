import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenSize.height * 0.7 * 1.1, // Make height responsive
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/video.png'), // Add your image path here
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.05,
                    vertical: screenSize.height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white54,
                        ),
                        padding: EdgeInsets.all(screenSize.width * 0.02),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: screenSize.width * 0.05,
                          ),
                        ),
                      ),
                      Text(
                        'Bad Guy',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: screenSize.width * 0.055,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Row(
              children: [
                CircleAvatar(
                  radius: screenSize.width * 0.07,
                  backgroundImage: AssetImage('assets/images/video.png'),
                ),
                SizedBox(
                  width: screenSize.width * 0.03,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bad Guy',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: screenSize.width * 0.047,
                        ),
                      ),
                      Text(
                        'Billie Eilish',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 138, 134, 134),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: screenSize.width * 0.075,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
