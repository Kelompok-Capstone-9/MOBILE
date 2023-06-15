import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/model/plan.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/component/register/card_member.dart';
import 'package:gofit_apps/view_model/plan_provider.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';

import 'payment_method_screen.dart';

class JoinMemberScreen extends StatefulWidget {
  const JoinMemberScreen({Key? key}) : super(key: key);
  @override
  State<JoinMemberScreen> createState() => _JoinMemberScreenState();
}

class _JoinMemberScreenState extends State<JoinMemberScreen> {
  String _memberPackage = "";
  @override
  Widget build(BuildContext context) {
    // var mediaquery = MediaQuery.of(context).size;
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
            child: const Icon(Icons.arrow_back, color: Colors.black)),
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
              SizedBox(
                height: 270,
                child: ListView.builder(
                    itemCount: memberPackage.length,
                    itemBuilder: (context, index) {
                      var i = memberPackage[index];
                      return GestureDetector(
                        onTap: () => setState(() {
                          _memberPackage = i['duration'].toString();
                          memberPackage = memberPackage.map((item) {
                            if (item['duration'] == i['duration']) {
                              return {
                                ...item,
                                'onTap': true,
                              };
                            } else {
                              return {
                                ...item,
                                'onTap': false,
                              };
                            }
                          }).toList();
                        }),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                // ignore: unrelated_type_equality_checks
                                color: i['onTap'] == true
                                    ? Colors.red
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
                                duration: i['duration'].toString(),
                                price: i['price'].toString(),
                                desc: i['desc'].toString())),
                      );
                    }),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HoverButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onpressed: () {
                    var id;
                    var name;
                    var duration;

                    final prov =
                        Provider.of<PlanProvider>(context, listen: false)
                            .getPlanUser(
                                id: PlanData(id: id),
                                name: PlanData(name: name),
                                duration: PlanData(duration: duration));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentMethod()));
                  },
                  color: const Color(0xffFF7F00),
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
