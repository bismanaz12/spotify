import 'package:flutter/material.dart';

class ChooseMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      // Remove the default app bar
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/chossemode.png'), // Update with your image path
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
                SizedBox(height: 400),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 25),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 90, 83, 83),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset('assets/images/Moon.png'),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 35, 33, 33),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset('assets/images/Sun 1.png'),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Light Mode',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Color(0xff42C83C)),
                    onPressed: () {},
                    child: Text(
                      'Continue',
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
