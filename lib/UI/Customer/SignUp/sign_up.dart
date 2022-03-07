import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/login.dart';
import 'package:the_middlemen/Models/Customer%20Models/signup.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:provider/src/provider.dart';
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackAppBar(
        title: 'Sign Up',
        bodyPass: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            reverse: false,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 32.00,
                            ),
                            BlueTextFormField(
                              hintText: 'Username',
                              icon: Icons.person_outline,
                              controller: nameController,
                              validator: (String? value) {
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
                              hintText: 'Email',
                              icon: Icons.email_outlined,
                              controller: emailController,
                              validator: (String? value) {
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
                            BlueTextFormField(
                              hintText: 'First Name',
                              icon: Icons.person_outline,
                              controller: fNameController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your First Name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            BlueTextFormField(
                              hintText: 'Last Name',
                              icon: Icons.person_outline,
                              controller: lNameController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Last Name";
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
                            SignUpPass(
                              passwordController: passwordController,
                              isHiddenPassword: isHiddenPassword,
                              isConfirmHiddenPassword: isConfirmHiddenPassword,
                              onPress: (){
                              setState(() {
                                isHiddenPassword = !isHiddenPassword;
                              });
                            },),
                            const SizedBox(
                              height: 16.0,
                            ),
                            ConfirmPassword(
                              confirmPasswordController: confirmPasswordController,
                              isConfirmHiddenPassword: isConfirmHiddenPassword,
                              passwordController: passwordController,
                              onPress: (){
                              setState(() {
                                isConfirmHiddenPassword = !isConfirmHiddenPassword;
                              });
                            },),
                            const SizedBox(
                              height: 32.0,
                            ),
                            LoginButton(text: 'Sign Up', onPress: () async{
                              result =
                              await Connectivity().checkConnectivity();
                              if (result == ConnectivityResult.mobile ||
                                  result == ConnectivityResult.wifi) {
                                if (_formKey.currentState!.validate()) {

                                  final username = nameController.text;
                                  final email = emailController.text;
                                  final first_name = fNameController.text;
                                  final last_name = lNameController.text;
                                  final phone = phoneNoController.text;
                                  final password = passwordController.text;
                                  final confirmPassword = confirmPasswordController.text;
                                  SharedPreferences sp = await SharedPreferences.getInstance();
                                  try {
                                    SignUp? signup = await NetworkHelper()
                                        .getSignUpData(username, email, first_name,last_name,
                                        password, confirmPassword);
                                    var token = signup?.token;
                                    if (token != null) {
                                      sp.setString('fName', first_name);
                                      sp.setString('lName', last_name);
                                      sp.setString('phone', phone);
                                      context.read<DataProvider>().firstName(first_name);
                                      context.read<DataProvider>().lastName(last_name);
                                      context.read<DataProvider>().pNumber(phone);
                                      showSnackBar(
                                        context,
                                        "Success",
                                        Colors.green,
                                        Icons.info,
                                        "Your account has been registered.",
                                      );
                                      Navigator.of(context)
                                          .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectUser(),
                                          ),
                                              (route) => route.isFirst);
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                      context,
                                      "Attention",
                                      Colors.red,
                                      Icons.info,
                                      "The email has already been taken.",
                                    );
                                    print(e);
                                  }
                                }else {
                                  /*   showSnackBar(
                                    context,
                                    "Attention",
                                    Colors.red,
                                    Icons.info,
                                    "Unsuccessful.",
                                  );*/
                                  return print("Unsuccessful");
                                }
                              }else {
                                showSnackBar(
                                  context,
                                  "Attention",
                                  Colors.blue,
                                  Icons.info,
                                  "You must be connected to the internet.",
                                );
                              }
                            },color: kStyleAppColor),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?  ',
                                  style: kStyleNormal.copyWith(color: Colors.grey)
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => const SelectUser(),
                                      ),
                                      ModalRoute.withName('/'),
                                    );
                                  },
                                  child: Text(
                                    'Log In',
                                    style: kStyleNormal.copyWith(color: Color(0xff3F84FC),fontWeight: FontWeight.w500)
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
      ),
    );
  }
}


