import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/login_field.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  bool isHiddenPassword = true;
  bool isChecked = false;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 30,),
            Image.asset('assets/Logo/logo2.png'
                ,height: 150,
                width: 150,),
            const SizedBox(height: 30,),
            Column(
              children: [
                Column(
                  children: [
                    Text('Welcome, User',style: kStyleTitle,),
                    const SizedBox(height: 16,),
                    Text('Let\'s start with what you want\n to use this app for',
                      style: kStyleNormal,
                      textAlign: TextAlign.center,),
                  ],
                ),



                Column(
                  children: [
                    const SizedBox(height: 24),
                    Text('Select User Type',style: kStyleTitle,),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(0, 3))
                            ]),
                        child: TabBar(
                            isScrollable: true,
                            unselectedLabelStyle: TabText,
                            indicator: BoxDecoration(
                                color: kStyleAppColor,
                                borderRadius: BorderRadius.circular(4)),
                            labelColor: Colors.white,
                            labelStyle: TabText,
                            unselectedLabelColor: kStyleAppColor,
                            // Tabbar tabs
                            tabs: [
                              TabBarTabs(
                                text: 'Customer',
                                image: Icons.person_outline
                              ),
                              TabBarTabs(
                                text: 'Driver',
                                image: Icons.delivery_dining_outlined,)
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        height: 250,
                        child: TabBarView(children: [
                          //Customer Login(TAB 1)
                          LoginField(emailController: emailController,widget: PasswordTextFormField(passController: passwordController,isHiddenPassword: isHiddenPassword,icon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              isHiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kStyleAppColor,
                            ), onPressed: () {
                            setState(() {
                              isHiddenPassword = !isHiddenPassword;
                            });
                          },
                          ),),
                          loginText: 'Customer Log In',
                          ),
                          //Driver Login(TAB 2)
                          LoginField(emailController: emailController,widget: PasswordTextFormField(passController: passwordController,isHiddenPassword: isHiddenPassword,icon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              isHiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kStyleAppColor,
                            ), onPressed: () {
                            setState(() {
                              isHiddenPassword = !isHiddenPassword;
                            });
                          },
                          ),),
                            loginText: 'Driver Log In',
                          ),
                        ]),
                      ),
                    )



                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}




