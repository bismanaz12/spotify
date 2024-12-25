import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/screens/homepage.dart';
import 'package:spotify/screens/signup.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  TextEditingController emailcont = TextEditingController();
  TextEditingController passcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
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
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                      height: 40,
                      child: Image.asset(
                        'assets/images/spotify.png',
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'If You Have Any Support!',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 55, 55, 55),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Click Here',
                    style: TextStyle(
                      color: Color(0xff42C83C),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 188, 186, 186), width: 0.9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: TextFormField(
                        controller: emailcont,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Username or Email',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 188, 186, 186),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 188, 186, 186), width: 0.9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: TextFormField(
                        controller: passcont,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 188, 186, 186),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recovery Password',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Poppins', fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 85),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(37)),
                      backgroundColor: Color(0xff42C83C)),
                  onPressed: () async {
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential userCredential =
                          await auth.signInWithEmailAndPassword(
                        email: emailcont.text,
                        password: passcont.text,
                      );

                      if (userCredential.user != null) {
                        // User signed in successfully
                        // Add your navigation or success logic here
                        emailcont.clear();
                        passcont.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        print('User signed in: ${userCredential.user!.uid}');
                      }
                    } catch (e) {
                      // Handle sign-in errors
                      print('Sign-in error: $e');
                      // You can show an error message to the user here
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 40,
                      child: Image.asset(
                        'assets/images/google.png',
                        fit: BoxFit.cover,
                      )),
                  Container(
                      height: 40,
                      child: Image.asset(
                        'assets/images/apple.png',
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not A Member ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        color: Color(0xff288CE9),
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
