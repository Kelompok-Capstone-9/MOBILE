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
                          color: Color(0xffFF8B82),
                          title: 'Basic Monthly',
                          subtitle: 'Rp 49.990',
                          trailing: '/MONTH',
                        ),
                        CardItem(
                          color: Color(0xff158058),
                          title: 'Intermediate Monthly',
                          subtitle: 'Rp 144.990',
                          trailing: '/3 MONTH',
                        ),
                        CardItem(
                          color: Color(0xffFF7F00),
                          title: 'Advace Monthly',
                          subtitle: 'Rp 289,990',
                          trailing: '/6 MONTH',
                        ),
                        CardItem(
                          color: Color(0xffFFC166),
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
