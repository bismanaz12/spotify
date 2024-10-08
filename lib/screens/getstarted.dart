import 'package:flutter/material.dart';
import 'package:spotify/screens/choosemode.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/getstarted.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: height - MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top section with logo
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.02,
                      ),
                      child: Container(
                        height: height * 0.06,
                        child: Image.asset(
                          'assets/images/spotify.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Middle section with main content
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.35),
                          Text(
                            'Enjoy Listening To Music',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              fontSize: width * 0.06, // Responsive font size
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height * 0.03),
                          Text(
                            'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Sagittis enim \npurus sed phasellus. Cursus ornare id scelerisque aliquam.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff797979),
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Poppins',
                              fontSize: width * 0.04, // Responsive font size
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          // Button with responsive width and height
                          Container(
                            width: min(width * 0.85, 350), // Max width of 350
                            height: height * 0.08,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                backgroundColor: Color(0xff42C83C),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChooseMode()));
                              },
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize:
                                      width * 0.045, // Responsive font size
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to get minimum of two numbers
double min(double a, double b) {
  return a < b ? a : b;
}
