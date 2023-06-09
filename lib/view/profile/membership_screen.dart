import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../component/booking_detail/convert.dart';
import '../../component/profile/card_membership.dart';
import '../../component/profile/color_card_membership.dart';
import '../../themes/color_style.dart';
import '../../view_model/plan_member_provider.dart';
import '../register/screens/payment_method_screen.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  void initiState() {
    print("s");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() =>
        Provider.of<PlanProvider>(context, listen: false).fetchDataPlan());
    int selectedPlanId = 0;
    int idPlan = 0;

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
                    child: Consumer<PlanProvider>(builder: (context, value, _) {
                      if (value.planMember.isEmpty ||
                          value.planMember == null) {
                        value.fetchDataPlan();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.planMember.length,
                        itemBuilder: (context, index) {
                          final plan = value.planMember[index];
                          LinearGradient randomGradient =
                              linearGradient[index % linearGradient.length];
                          int? duration = plan.duration;
                          String convert = '';
                          if (duration != null) {
                            convert = (duration ~/ 30).toString();
                          }
                          return CardItem(
                            idPlan: int.parse(plan.id.toString()),
                            gradient: randomGradient,
                            title: plan.name ?? '',
                            subtitle: formatCurrency(
                                    int.parse(plan.price.toString())) ??
                                '',
                            trailing: '/$convert MONTH',
                            description: plan.description ?? '',
                          ).animate().fadeIn().slideY();
                        },
                      );
                    }),
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
