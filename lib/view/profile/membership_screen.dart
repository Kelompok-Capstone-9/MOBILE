import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../component/profile/card_membership.dart';
import '../../themes/color_style.dart';
import '../../view_model/plan_member_provider.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  List<LinearGradient> linearGradient = const [
    LinearGradient(
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
    LinearGradient(
      begin: Alignment(-0.8, -0.8),
      end: Alignment(0.5, 1.0),
      stops: [0.092, 1.9114],
      colors: [
        Color(0xFF158058),
        Color.fromRGBO(21, 128, 88, 0),
      ],
      transform: GradientRotation(167.29),
    ),
    LinearGradient(
      begin: Alignment(3.0, 3.5),
      end: Alignment(-0.5, 1.2),
      stops: [-0.2962, 1.1182],
      colors: [
        Color(0xFFFF7F00),
        Color.fromRGBO(255, 127, 0, 0.366667),
      ],
      transform: GradientRotation(173.63),
    ),
  ];

  @override
  void initState() {
    super.initState();
    final planProvider = Provider.of<PlanProvider>(context, listen: false);
    planProvider.fetchDataPlan();
  }

  @override
  Widget build(BuildContext context) {
    final planProvider = Provider.of<PlanProvider>(context);
    final planModel = planProvider.planMember;

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Consumer<PlanProvider>(
                      builder: (context, value, child) => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: planModel.length,
                        itemBuilder: (context, index) {
                          final plan = planModel[index];
                          LinearGradient randomGradient = linearGradient[index];
                          var nilai = plan?.duration;
                          var convert = '';
                          if (nilai == 30) {
                            convert = '1';
                          } else if (nilai == 90) {
                            convert = '3';
                          } else {
                            convert = '6';
                          }
                          return CardItem(
                            gradient: randomGradient,
                            title: plan?.name ?? '',
                            subtitle: 'Rp ${plan?.price ?? ''}',
                            trailing: '/$convert MONTH',
                          );
                        },
                      ),
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
