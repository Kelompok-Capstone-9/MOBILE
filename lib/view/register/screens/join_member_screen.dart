import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/model/plan.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/component/register/card_member.dart';
import 'package:gofit_apps/view/login/login_screen.dart';
import 'package:gofit_apps/view_model/login_provider.dart';
import 'package:gofit_apps/view_model/plan_provider.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:provider/provider.dart';

import 'payment_method_screen.dart';

class JoinMemberScreen extends StatefulWidget {
  const JoinMemberScreen({Key? key}) : super(key: key);

  @override
  State<JoinMemberScreen> createState() => _JoinMemberScreenState();
}

class _JoinMemberScreenState extends State<JoinMemberScreen> {
  int selectedPlanId = 0;
  int idPlan = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<RegisterProvider>(context, listen: false).fetchDataPlanJoin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: ColorsTheme.bgScreen,
        title: Text(
          'Step 6 of 6',
          style: ThemeText.heading1,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 36),
              ),
              Text('Join Our Membership', style: ThemeText.headingLogin),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 87,
                  right: 87,
                  bottom: 24,
                ),
                child: Text(
                  'Get unlimited access',
                  style: ThemeText.headingMember,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 107.5,
                  right: 107.5,
                  bottom: 58,
                ),
                child: Text(
                  'Proper Exercise Technique',
                  style: ThemeText.headingMember2,
                ),
              ),
              SizedBox(
                height: 270,
                child: Consumer<RegisterProvider>(
                  builder: (context, registerProvider, _) => ListView.builder(
                    itemCount: registerProvider.planList.length,
                    itemBuilder: (context, index) {
                      var i = registerProvider.planList[index];
                      var nilai = i.duration;
                      int convert = 0;
                      if (nilai == 30) {
                        convert = 3;
                      } else if (nilai == 180) {
                        convert = 6;
                      } else if (nilai == 90) {
                        convert = 3;
                      }
                      bool isSelected = selectedPlanId == i.id;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPlanId = i.id!;
                          });
                          print('Selected plan ID: $selectedPlanId');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: isSelected
                                  ? ColorsTheme.primary600
                                  : const Color(0xff919191).withOpacity(0.6),
                            ),
                          ),
                          elevation: 0.2,
                          color: ColorsTheme.bgScreen,
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 20,
                            top: 16,
                          ),
                          child: CardMember(
                            duration: '${convert.toString()} Month',
                            price: "Rp. ${i.price.toString()}",
                            desc: 'per ${convert.toString()} Month',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Consumer<RegisterProvider>(
                builder: (context, registerProv, child) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFF7F00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      idPlan = selectedPlanId;
                      final providerLogin =
                          Provider.of<LoginProvider>(context, listen: false);

                      if (providerLogin.statusCode == 200) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PaymentMethod(idPlan: idPlan),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Continue',
                        style: ThemeText.heading1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  LoginProvider loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);
                  loginProvider.logout(params: 0, context: context);
                },
                child: Text(
                  'No Thanks',
                  style: ThemeText.heading1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
