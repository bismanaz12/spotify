import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/models/usermodel.dart';
import 'package:spotify/screens/signin.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController namecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController passcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            children: [
              SizedBox(height: height * 0.04),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 238, 238),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(width * 0.025),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: width * 0.035,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: width * 0.2),
                  SizedBox(
                    height: height * 0.05,
                    child: Image.asset(
                      'assets/images/spotify.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'If You Have Any Support!',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 55, 55, 55),
                      fontSize: width * 0.04,
                    ),
                  ),
                  Text(
                    'Click Here',
                    style: TextStyle(
                      color: Color(0xff42C83C),
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 188, 186, 186),
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Center(
                    child: TextFormField(
                      controller: namecont,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 188, 186, 186),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 188, 186, 186),
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Center(
                    child: TextFormField(
                      controller: emailcont,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 188, 186, 186),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 188, 186, 186),
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Center(
                    child: TextFormField(
                      controller: passcont,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 188, 186, 186),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * 0.85, height * 0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(37),
                  ),
                  backgroundColor: Color(0xff42C83C),
                ),
                onPressed: () async {
                  try {
                    // Validate input fields
                    if (emailcont.text.isEmpty ||
                        passcont.text.isEmpty ||
                        namecont.text.isEmpty) {
                      // Show an error message to the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields')),
                      );
                      return;
                    }

                    // Create user account
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailcont.text,
                      password: passcont.text,
                    );

                    // Create user model
                    Usermodel model = Usermodel(
                      email: emailcont.text,
                      name: namecont.text,
                      pass: passcont.text,
                      id: userCredential.user!.uid,
                    );

                    // Save user data to Firestore
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userCredential.user!.uid)
                        .set(model.toMap());

                    // Clear input fields
                    emailcont.clear();
                    namecont.clear();
                    passcont.clear();

                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User registered successfully')),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  } catch (e) {
                    // Handle errors (e.g., email already in use, weak password)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: width * 0.05,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Text(
                    'Or',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height * 0.05,
                    child: Image.asset(
                      'assets/images/google.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    child: Image.asset(
                      'assets/images/apple.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do You Have An Account ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.04,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xff288CE9),
                        fontSize: width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
