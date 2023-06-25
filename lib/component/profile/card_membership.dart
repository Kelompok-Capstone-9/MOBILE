import 'package:flutter/material.dart';
import 'package:gofit_apps/view_model/plan_member_provider.dart';
import 'package:provider/provider.dart';
import '../../themes/color_style.dart';
import '../../view/register/screens/payment_method_screen.dart';

class CardItem extends StatelessWidget {
  final Gradient gradient;
  final String title;
  final String subtitle;
  final String trailing;
  final String description;

  const CardItem({
    Key? key,
    required this.gradient,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planProvider = Provider.of<PlanProvider>(context);
    final planModel = planProvider.planMember;
    int selectedPlanId = 0;
    int idPlan = 0;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: gradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: ThemeText.headingCustomTittle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        subtitle,
                        style: ThemeText.headingCustomRp,
                      ),
                      Text(
                        trailing,
                        style: ThemeText.headingTextPlan,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              Text(
                description,
                style: ThemeText.headingCustomTittle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: ColorsTheme.colorButton,
                  ),
                  onPressed: () {
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentMethod(idPlan: planProvider.plan!.id!),
                        ),
                      );
                    };
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'GET MEMBERSHIP',
                      style: ThemeText.headingCustomTittle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms and conditions',
                    style: ThemeText.headingCustomTerms,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'apply.',
                    style: ThemeText.headingCustomApply,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
