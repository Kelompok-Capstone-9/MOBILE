import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gofit_apps/component/booking_detail/convert.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';

import 'package:gofit_apps/component/register/card_pay.dart';
import 'package:gofit_apps/view/register/screens/payment_method_screen.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../component/booking_detail/card.dart';
import '../../../view_model/newsLetter_provider.dart';
import '../../login/login_screen.dart';

// ignore: must_be_immutable
class TransactionDetailScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var methodPay;

  int planId;
  TransactionDetailScreen(
      {super.key, required this.methodPay, required this.planId});
  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  void initState() {
    super.initState();
    final prov = Provider.of<RegisterProvider>(context, listen: false);
    Future.microtask(() => Provider.of<RegisterProvider>(context, listen: false)
        .getPlanDetail(idPlan: widget.planId));
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    Future.microtask(() => Provider.of<RegisterProvider>(context, listen: false)
        .joinMember(idPlan: widget.planId));
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.2,
          title: Text('Transaction Details', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Consumer<RegisterProvider>(
        builder: (context, prov, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Membership Details',
                    style: ThemeText.headingLogin,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: listMembership(context, prov),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                    ),
                    child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffD9D9D9),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: _detailPayment(prov)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffD9D9D9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: _totalPayment(prov),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: _paymentMethod(mediaquery, prov),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Column _paymentMethod(mediaquery, provider) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Methode',
            style: ThemeText.heading2,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              log('masuk ke screen pilih payment methode');
              print(provider['idPlan']);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PaymentMethod(pro)),
              // );
            },
            child: widget.methodPay == null
                ? CardWidget(
                    icon: FontAwesomeIcons.wallet, keterangan: "Select payment")
                : SizedBox(
                    width: 350,
                    height: 90,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: const Color(0xff919191).withOpacity(0.6),
                          ),
                        ),
                        elevation: 5,
                        color: ColorsTheme.bgScreen,
                        child: SizedBox(
                          child: CardPay(
                            type: paymentMethode[widget.methodPay]['type']
                                .toString(),
                            desc: paymentMethode[widget.methodPay]['desc']
                                .toString(),
                            image: paymentMethode[widget.methodPay]['image']
                                .toString(),
                          ),
                        )),
                  ),
          )
              .animate()
              .saturate()
              .shimmer()
              .fadeIn()
              .effect(duration: const Duration(seconds: 6)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Change payment',
                style: ThemeText.headingChangePaymentMember,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            // width: 400,
            // height: 150,
            child: GestureDetector(
              onTap: () async {
                if (provider.statusCode == 201) {
                  // var pay = provider/
                  print('sttaus = ${provider.statusCode}');
                  print('ini transaksi infomu ${provider.getLinkPay}');
                  provider.payPlan(linkPay: provider.getLinkPay);
                  successDialog(context, mediaquery, provider);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 370,
                decoration: BoxDecoration(
                  color: ColorsTheme.activeButton,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pay',
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: ColorsTheme.activeText),
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel Order',
                  style: ThemeText.headingChangePaymentMember,
                )),
          )
        ],
      );
}

Column _totalPayment(provider) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'Total Payment',
            style: ThemeText.heading1,
          ),
          const Spacer(),
          Text(
            formatCurrency(provider.dataPlan.price),
            style: ThemeText.heading2,
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Column _detailPayment(provider) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Payment Details',
        style: ThemeText.heading1,
      ),
      const SizedBox(
        height: 12,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Subscription Cost',
                style: ThemeText.heading2,
              ),
              const Spacer(),
              Text(
                formatCurrency(provider.dataPlan.price),
                style: ThemeText.heading2,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'Discount',
                style: ThemeText.heading2,
              ),
              const Spacer(),
              Text(
                formatCurrency(0),
                style: ThemeText.heading2,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ],
  );
}

Column listMembership(context, prov) {
  var duration = prov.dataPlan?.duration;
  int convert = 0;
  if (duration != null) {
    convert = (duration ~/ 30);
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            'Subscription',
            style: ThemeText.heading2,
          ),
          const Spacer(),
          Text(
            '$convert Month',
            style: ThemeText.heading2,
          )
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Text(
            'StartingDate',
            style: ThemeText.heading2,
          ),
          const Spacer(),
          Text(
            prov.getCurrentDate(),
            style: ThemeText.heading2,
          )
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Text(
            'Ending Date',
            style: ThemeText.heading2,
          ),
          const Spacer(),
          Text(
            prov.getTanggalPlus(
                ditambah: int.parse(prov.dataPlan!.duration.toString())),
            style: ThemeText.heading2,
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Future<void> successDialog(BuildContext context, mediaquery, provider) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
          ],
        ),
      );
    },
  );
  await Future.delayed(const Duration(seconds: 5), () {
    Navigator.of(context).pop();
  });
  // ignore: use_build_context_synchronously
  showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsTheme.bgScreen,
          insetPadding: const EdgeInsets.all(0),
          icon: Builder(builder: (context) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FormLogin())),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.close),
              ),
            );
          }),
          content: SizedBox(
            width: 360,
            height: mediaquery.height,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 48, top: 48),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: ColorsTheme.success),
                  child: Icon(Icons.check,
                      size: 52, color: ColorsTheme.activeText),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Payment Successful! ${provider.getLinkPay}',
                    style: ThemeText.headingpaymentSucces,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 44.0),
                  child: Text(
                    'Hooray! You have completed your payment.',
                    style: ThemeText.headingAmountPaid,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child:
                      Text('Amount Paid!', style: ThemeText.headingAmountPaid),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 44.0),
                  child: Text(
                    formatCurrency(provider.dataPlan.price),
                    style: ThemeText.headingRupiah,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    log('masuk ke login screen (redirect to login)');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FormLogin()));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 38,
                      width: 360,
                      decoration: BoxDecoration(
                        color: ColorsTheme.activeButton,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Done',
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorsTheme.activeText),
                      )),
                ),
              ],
            ),
          ),
        );
      });
}
