import 'package:flutter/material.dart';
import 'package:gofit_apps/view/profile/widget/card_gender.dart';
import 'package:gofit_apps/view/profile/widget/card_goal_weight.dart';
import 'package:gofit_apps/view/profile/widget/card_height.dart';
import 'package:gofit_apps/view/profile/widget/card_password.dart';
import 'package:gofit_apps/view/profile/widget/card_training_level.dart';
import 'package:gofit_apps/view/profile/widget/card_weight.dart';
import '../../themes/color_style.dart';
import 'widget/card_username.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Details',
          style: ThemeText.heading1,
        ),
        iconTheme: const IconThemeData(color: Color(0xff030303)),
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 0.2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Email',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  'email.gmail.com',
                  style: ThemeText.headingSub2,
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Username',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  'User',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardUsername();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Password',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  '********',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardPassword();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Gender',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  'Male',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CardGender();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Height',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  '173 cm',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CardHeight();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Weight',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  '73 kg',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CardWeight();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Goal Weight',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  '65 kg',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CardGoalWeight();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Training Level',
                  style: ThemeText.headingPersonal,
                ),
                subtitle: Text(
                  'Beginner',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CardTrainingLevel();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
