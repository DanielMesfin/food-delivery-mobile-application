import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ReusableComponents/round_button.dart';
import 'package:food_delivery/constances/Styes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/constances/get_size.dart';
import 'package:gap/gap.dart';
import 'registration_screen.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  //class variable
  bool cricularSpiner = false;
  final _auth = FirebaseAuth.instance;
  String emailAddress = '';
  String password = '';

  // animation
  late AnimationController controller;
  late Animation animation;

  // animation method
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.greenAccent, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(
      () {
        setState(
          () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: animation.value,
        backgroundColor: Colors.black87,
        body: Stack(
          children: [
            cricularSpiner
                ? const Positioned(
                    top: 42,
                    right: 140,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  )
                : Text(''),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidth(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 150.0,
                        child: Image.asset('images/bingo.PNG'),
                      ),
                    ),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                  //TODO these is deprecated so you should change it to animated text,
                  TypewriterAnimatedTextKit(
                    textAlign: TextAlign.justify,
                    text: const ['BINGO Burgers'],
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      emailAddress = value;
                    },
                    style: const TextStyle(color: Colors.black87, fontSize: 18),
                    decoration: Styles.KInputDecoration.copyWith(
                        hintText: 'Enter Your Email'),
                  ),
                  Gap(
                    GetSize.getScreenHeight(10),
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    style: const TextStyle(color: Colors.black87, fontSize: 18),
                    decoration: Styles.KInputDecoration.copyWith(
                        hintText: 'Enter Your Password'),
                  ),
                  Gap(
                    GetSize.getScreenHeight(20),
                  ),
                  ResueMatterialButton(
                    colorInput: Styles.buttonBgColor,
                    textLabel: 'Log In',
                    onPressInput: () async {
                      setState(() {
                        cricularSpiner = true;
                      });
                      try {
                        final logedUser =
                            await _auth.signInWithEmailAndPassword(
                                email: emailAddress, password: password);
                        // ignore: unnecessary_null_comparison
                        if (logedUser != null) {
                          final emailAddressOfUser = _auth.currentUser?.email;
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, MyHomePage.id,
                              arguments: emailAddressOfUser);
                          // print(' this is the person login in to  from login page${_auth.currentUser?.email}');
                        } else {
                          setState(() {
                            cricularSpiner = false;
                          });
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                icon: Icon(
                                  Icons.error,
                                  color: Colors.redAccent,
                                ),
                                content: Text(
                                  'Wrong Email or Password',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              );
                            },
                          );
                        }
                      } catch (e) {
                        cricularSpiner = false;
                        // print(e);
                      }
                      cricularSpiner = false;
                    },
                  ),
                  Gap(
                    GetSize.getScreenHeight(8),
                  ),
                  const Text(
                    'Forget Password ?',
                    style: Styles.linkText,
                    textAlign: TextAlign.end,
                  ),
                  Gap(
                    GetSize.getScreenHeight(7.5),
                  ),
                  Row(
                    children: [
                      Text(
                        'Hav\'t account ?',
                        style: Styles.linkText.copyWith(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen()));
                        },
                        child: const Text(
                          ' Register Now',
                          style: Styles.linkText,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
