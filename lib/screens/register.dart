import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 400,
                left: -15,
                child: Container(
                    height: 500,
                    child: Image.asset(
                      'assets/images/cartoon.png',
                      fit: BoxFit.cover,
                    ))),
            Container(
                child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 246, 238, 238),
                          shape: BoxShape.circle),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 13,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Image.asset('assets/images/spotify.png'),
              SizedBox(
                height: 55,
              ),
              Text(
                'Enjoy Listening To Music',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Spotify is a proprietary Swedish audio \nstreaming and media services provider ',
                style: TextStyle(
                    color: Color.fromARGB(255, 151, 151, 151),
                    fontSize: 16,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fixedSize: Size(150, 70),
                          backgroundColor: Color(0xff42C83C)),
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fixedSize: Size(150, 70),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                ],
              ),
            ])),
          ],
        ));
  }
}
