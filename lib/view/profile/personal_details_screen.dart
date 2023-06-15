import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../component/profile/card_gender.dart';
import '../../component/profile/card_goal_weight.dart';
import '../../component/profile/card_height.dart';
import '../../component/profile/card_password.dart';
import '../../component/profile/card_training_level.dart';
import '../../component/profile/card_username.dart';
import '../../component/profile/card_weight.dart';
import '../../model/login.dart';
import '../../themes/color_style.dart';
import '../../view_model/login_provider.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    UserLogin? user = loginProvider.userLogin;
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
                  user?.email ?? '',
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
                  user?.name ?? '',
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
                  '•' * (user?.password?.length ?? 0),
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CardPassword();
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
                  user?.gender ?? '',
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
                  (user?.height ?? 0).toString(),
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
                  (user?.weight ?? 0).toString(),
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
                  (user?.goalWeight ?? 0).toString(),
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
