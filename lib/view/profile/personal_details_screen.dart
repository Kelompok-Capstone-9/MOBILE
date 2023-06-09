import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  String token = "";

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
                  onPressed: () async {
                    final token = await loginProvider.getToken();

                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardUsername(
                            user: user, token: token.toString());
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
                  // '•' * (user?.password?.length ?? 0),
                  user?.password ?? '',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () async {
                    final token = await loginProvider.getToken();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardPassword(
                            user: user, token: token.toString());
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
                  onPressed: () async {
                    final token = await loginProvider.getToken();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardGender(user: user, token: token.toString());
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
                  onPressed: () async {
                    final token = await loginProvider.getToken();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardHeight(user: user, token: token.toString());
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
                  onPressed: () async {
                    final token = await loginProvider.getToken();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardWeight(user: user, token: token.toString());
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
                  (user?.goal_weight ?? 0).toString(),
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () async {
                    final token = await loginProvider.getToken();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardGoalWeight(
                            user: user, token: token.toString());
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
                  user?.training_level ?? '',
                  style: ThemeText.headingSub2,
                ),
                trailing: IconButton(
                  onPressed: () async {
                    final token = await loginProvider.getToken();
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardTrainingLevel(
                            user: user, token: token.toString());
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
      ).animate().fadeIn(),
    );
  }
}
