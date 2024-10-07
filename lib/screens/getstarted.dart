import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Remove the default app bar
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/getstarted.png'), // Update with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content widgets here
                SizedBox(
                  height: 35,
                ),
                Container(
                    height: 50,
                    child: Image.asset(
                      'assets/images/spotify.png',
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 435),
                Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Sagittis enim \npurus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff797979),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Color(0xff42C83C)),
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 20),
                    ))
                // Add more widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
