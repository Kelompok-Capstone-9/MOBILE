import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/widget/card_pay.dart';

class TransactionDetailScreen extends StatefulWidget {
  const TransactionDetailScreen({Key? key}) : super(key: key);
  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Transaction Details', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: SingleChildScrollView(
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
                child: listMembership(),
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
                    child: _detailPayment()),
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
                  child: _totalPayment(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: _paymentMethod(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _paymentMethod() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Methode',
            style: ThemeText.heading2,
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: const Color(0xff919191).withOpacity(0.6),
              ),
            ),
            elevation: 0.2,
            color: ColorsTheme.bgScreen,
            margin: const EdgeInsets.only(top: 16),
            child: ListTile(
              title: Text(
                'GO-PAY',
                style: ThemeText.heading3,
              ),
              subtitle: Text(
                'Scan QR code with GO-JEK app',
                style: ThemeText.headingPaymentDescription,
              ),
              trailing: SizedBox(
                width: 60,
                child:
                    Image.asset('assets/images/gopay.png', fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Change payment',
                style: ThemeText.headingChangePayment,
              ),
            ),
          )
        ],
      );

  Column _totalPayment() {
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
              'Rp 99.000',
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

  Column _detailPayment() {
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
                  'Rp 99.000',
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
                  '- Rp 0',
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

  Column listMembership() => Column(
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
                '1 Month',
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
                'April 27, 2023',
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
                'May 27, 2023',
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
