import 'package:flutter/material.dart';
import 'package:spotify/screens/register.dart';

class ChooseMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chossemode.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Spotify Logo
                        SizedBox(height: screenSize.height * 0.02),
                        SizedBox(
                          height: screenSize.height * 0.06,
                          child: Image.asset(
                            'assets/images/spotify.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        // Flexible space
                        SizedBox(height: screenSize.height * 0.35),

                        // Choose Mode Text
                        Text(
                          'Choose Mode',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            fontSize: screenSize.width * 0.06,
                          ),
                        ),

                        SizedBox(height: screenSize.height * 0.03),

                        // Mode Selection Row
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.1,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildModeOption(
                                context: context,
                                imagePath: 'assets/images/Moon.png',
                                label: 'Dark Mode',
                                backgroundColor:
                                    Color.fromARGB(255, 90, 83, 83),
                              ),
                              _buildModeOption(
                                context: context,
                                imagePath: 'assets/images/Sun 1.png',
                                label: 'Light Mode',
                                backgroundColor:
                                    Color.fromARGB(255, 35, 33, 33),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenSize.height * 0.08),

                        // Continue Button
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.1,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                double.infinity,
                                screenSize.height * 0.07,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              backgroundColor: Color(0xff42C83C),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: screenSize.width * 0.05,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenSize.height * 0.02),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeOption({
    required BuildContext context,
    required String imagePath,
    required String label,
    required Color backgroundColor,
  }) {
    final Size screenSize = MediaQuery.of(context).size;
    final double iconSize = screenSize.width * 0.15;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(screenSize.width * 0.03),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: iconSize,
            height: iconSize,
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: screenSize.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
