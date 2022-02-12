import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';

class CusSettings extends StatelessWidget {
  const CusSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kStyleBackground,
      body: CusSettingsContent(),
    );
  }
}

class CusSettingsContent extends StatefulWidget {
  const CusSettingsContent({Key? key}) : super(key: key);

  @override
  _CusSettingsContentState createState() => _CusSettingsContentState();
}

class _CusSettingsContentState extends State<CusSettingsContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
