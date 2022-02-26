import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isHiddenPassword = true;
  bool isConfirmHiddenPassword = true;
  bool isChecked = false;
  ConnectivityResult result = ConnectivityResult.none;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isConfirmHiddenPassword = !isConfirmHiddenPassword;
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackAppBar(
        Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            reverse: false,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'NutinoSansReg',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff324F81),
                              ),
                            ),
                            const SizedBox(
                              height: 32.00,
                            ),
                            BlueTextFormField(
                              'Username',
                              Icons.person_outline,
                              nameController,
                                  (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter username";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            BlueTextFormField(
                              'Email',
                              Icons.email_outlined,
                              emailController,
                                  (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter email";
                                }
                                if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            BlueTextFormFieldPN(
                              'Phone no.',
                              'assets/SignUp/phone.png',
                              phoneNoController,
                                  (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter phone number";
                                }
                                if (value.length < 10) {
                                  return "Please enter valid phone number";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: passwordController,
                              style: const TextStyle(
                                fontFamily: 'NutinoSansReg',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff777777),
                              ),
                              obscureText: isHiddenPassword,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: kStyleAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: kStyleAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: kStyleAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NutinoSansReg',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff777777),
                                ),
                                contentPadding:
                                const EdgeInsets.fromLTRB(8, 16, 0, 0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 12),
                                  child: Image.asset(
                                    'assets/SignUp/lock.png',
                                    width: 20,
                                    color: kStyleAppColor,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 17),
                                  child: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Image.asset(
                                      isConfirmHiddenPassword
                                          ? 'assets/SignUp/eye.png'
                                          : 'assets/SignUp/eye.png',
                                      width: 20,
                                      color: kStyleAppColor,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter a password";
                                }
                                if (value.length < 8) {
                                  return "Your password must be at least 8 character";
                                }
                                if (!value.contains(RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
                                  return "Your password must contain certain letters eg:(Aa9@)";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: confirmPasswordController,
                              style: const TextStyle(
                                fontFamily: 'NutinoSansReg',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff777777),
                              ),
                              obscureText: isConfirmHiddenPassword,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color:kStyleAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: kStyleAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: kStyleAppColor,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NutinoSansReg',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff777777),
                                ),
                                contentPadding:
                                const EdgeInsets.fromLTRB(8, 16, 0, 0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 12),
                                  child: Image.asset(
                                    'assets/SignUp/lock.png',
                                    width: 20,
                                    color: kStyleAppColor,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 17),
                                  child: InkWell(
                                    onTap: _toggleConfirmPasswordView,
                                    child: Image.asset(
                                      isConfirmHiddenPassword
                                          ? 'assets/SignUp/eye.png'
                                          : 'assets/SignUp/eye.png',
                                      width: 20,
                                      color: kStyleAppColor,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please re enter your password";
                                }
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return "Both the passwords don't match";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 32.0,
                            ),
                            LoginButton(text: 'Sign Up', onPress: () {},color: kStyleAppColor),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?  ',
                                  style: TextStyle(
                                    fontFamily: 'NutinoSansReg',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        /*            settings: RouteSettings(name: '/1'),*/
                                        builder: (context) => const SelectUser(),
                                      ),
                                      ModalRoute.withName('/'),
                                    );
                                    /*   Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                    (route) => false);*/
                                  },
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                      fontFamily: 'NutinoSansReg',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3F84FC),
                                    ),
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
              ),
            ],
          ),
        ),
        Colors.white,
      ),
    );
  }
}
