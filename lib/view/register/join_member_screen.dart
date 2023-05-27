import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/payment_method_screen.dart';
import 'package:hovering/hovering.dart';

class JoinMemberScreen extends StatefulWidget {
  const JoinMemberScreen({Key? key}) : super(key: key);
  @override
  State<JoinMemberScreen> createState() => _JoinMemberScreenState();
}

class _JoinMemberScreenState extends State<JoinMemberScreen> {
  @override
  Widget build(BuildContext context) {
    var isSelected = false;
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text(
          'Step 6 of 6',
          style: ThemeText.heading1,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 36)),
              Text('Join Our Membership', style: ThemeText.headingLogin),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 87, right: 87, bottom: 24),
                child: Text('Get unlimited access',
                    style: ThemeText.headingMember),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 107.5, right: 107.5, bottom: 58),
                child: Text('Proper Exercise Technique',
                    style: ThemeText.headingMember2),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color((0xffFF7F00)),
                    disabledForegroundColor: ColorsTheme.bgScreen),
                child: Container(
                  width: 328,
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Text('1 Month', style: ThemeText.heading1),
                      const Spacer(),
                      Text(
                        'Rp 99.000',
                        style: ThemeText.memberPaid,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color((0xffFF7F00)),
                    disabledForegroundColor: ColorsTheme.bgScreen),
                child: Container(
                  width: 328,
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Text('3 Month', style: ThemeText.heading1),
                      const Spacer(),
                      Text(
                        'Rp 199.000',
                        style: ThemeText.memberPaid,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color((0xffFF7F00)),
                    disabledForegroundColor: ColorsTheme.bgScreen),
                child: Container(
                  width: 328,
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Text('1 Year', style: ThemeText.heading1),
                      const Spacer(),
                      Text(
                        'Rp 699.000',
                        style: ThemeText.memberPaid,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HoverButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onpressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentMethodScreen()));
                  },
                  color: isSelected
                      ? const Color(0xffFF7F00)
                      : const Color(0xffDFDFDF),
                  hoverColor: const Color(0xffFF7F00),
                  hoverTextColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Continue',
                      style: ThemeText.heading1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
