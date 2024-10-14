import 'package:flutter/material.dart';
import 'package:spotify/screens/signin.dart';
import 'package:spotify/screens/signup.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background image positioning
            Positioned(
              top: height * 0.4, // 40% from top
              left: width * -0.04, // -4% from left
              child: SizedBox(
                height: height * 0.5, // 50% of screen height
                child: Image.asset(
                  'assets/images/cartoon.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.03),
                    // Back button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 246, 238, 238),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(width * 0.025),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: width * 0.035,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.1),
                    // Spotify logo
                    SizedBox(
                      width: width * 0.4, // 40% of screen width
                      child: Image.asset(
                        'assets/images/spotify.png',

                        
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    // Title
                    Text(
                      'Enjoy Listening To Music',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: width * 0.06, // Responsive font size
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.03),
                    // Subtitle
                    Text(
                      'Spotify is a proprietary Swedish audio\nstreaming and media services provider',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 151, 151, 151),
                        fontSize: width * 0.04, // Responsive font size
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.03),
                    // Buttons
                    Wrap(
                      spacing: width * 0.04,
                      runSpacing: height * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                          width: width > 600 ? width * 0.3 : width * 0.4,
                          height: height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: const Color(0xff42C83C),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width > 600 ? width * 0.3 : width * 0.4,
                          height: height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
