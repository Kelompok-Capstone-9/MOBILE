import 'package:flutter/material.dart';
import '../../component/profile/card_membership.dart';
import '../../themes/color_style.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgMembership,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgMembership,
        title: Row(
          children: [
            Text(
              'GoFit',
              style: ThemeText.headingDashboard,
            ),
            const SizedBox(width: 5),
            Text(
              'MEMBERSHIP',
              style: ThemeText.headingMembership,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/membership.png'),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xff393939),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GoFit Free',
                    style: ThemeText.headingTextFree,
                  ),
                  Text(
                    'CURRENT PLAN',
                    style: ThemeText.headingTextPlan,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: const [
                        CardItem(
                          gradient: LinearGradient(
                            begin: Alignment(2.0, 1.0),
                            end: Alignment(-1.0, -1.0),
                            stops: [0.0903, 1.4071, 1.4072],
                            colors: [
                              Color(0xFFFF8B82),
                              Color.fromRGBO(255, 139, 130, 0.366667),
                              Color.fromRGBO(255, 139, 130, 0),
                            ],
                            transform: GradientRotation(257.56),
                          ),
                          title: 'Basic Monthly',
                          subtitle: 'Rp 49.990',
                          trailing: '/MONTH',
                        ),
                        CardItem(
                          gradient: LinearGradient(
                            begin: Alignment(-0.8, -0.8),
                            end: Alignment(0.5, 1.0),
                            stops: [0.092, 1.9114],
                            colors: [
                              Color(0xFF158058),
                              Color.fromRGBO(21, 128, 88, 0),
                            ],
                            transform: GradientRotation(167.29),
                          ),
                          title: 'Intermediate Monthly',
                          subtitle: 'Rp 144.990',
                          trailing: '/3 MONTH',
                        ),
                        CardItem(
                          gradient: LinearGradient(
                            begin: Alignment(3.0, 3.5),
                            end: Alignment(-0.5, 1.2),
                            stops: [-0.2962, 1.1182],
                            colors: [
                              Color(0xFFFF7F00),
                              Color.fromRGBO(255, 127, 0, 0.366667),
                            ],
                            transform: GradientRotation(173.63),
                          ),
                          title: 'Advance Monthly',
                          subtitle: 'Rp 289,990',
                          trailing: '/6 MONTH',
                        ),
                        CardItem(
                          gradient: LinearGradient(
                            begin: Alignment(1.5, 3.0),
                            end: Alignment(-1.0, -1.0),
                            stops: [0.1389, 2.37, 2.374],
                            colors: [
                              Color(0xFFFFC166),
                              Color.fromRGBO(255, 193, 102, 0.15),
                              Color.fromRGBO(255, 193, 102, 0.37),
                            ],
                            transform: GradientRotation(288.15),
                          ),
                          title: 'Student',
                          subtitle: 'Rp 29.990',
                          trailing: '/MONTH',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
