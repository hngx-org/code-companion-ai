import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:in_app_payment/buttons/pay_buttons.dart';

import '../../../di/locator.dart';

enum Option { option1, option2 }

class Pay extends StatefulWidget {
  final int amount;
  const Pay({super.key, required this.amount});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  Option optionSelected = Option.option1;

  @override
  Widget build(BuildContext context) {
    final pay = HNGPay();
    final db = locator<HiveDB>();
    final name = db.get('name').toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.grey,
              letterSpacing: 0.7),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
              color: AppColor.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text(
                          'Welcome',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Choose Payment Method',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: RadioListTile<Option>(
                                    title: Image.asset('assets/images/A.png'),
                                    value: Option.option1,
                                    groupValue: optionSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        optionSelected = value!;
                                      });
                                    }),
                              ),
                              Flexible(
                                child: RadioListTile<Option>(
                                  title: Image.asset('assets/images/G.png'),
                                  value: Option.option2,
                                  groupValue: optionSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      optionSelected = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          'Total Price',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '\$${widget.amount}.00',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Column(
                          children: [
                            (optionSelected == Option.option2)
                                ? SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: SizedBox(
                                        width: 300,
                                        height: 900,
                                        child: pay.googlePay(context,
                                            userID: db.get('id'),
                                            amountToPay:
                                                widget.amount.toString()),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: SizedBox(
                                        width: 300,
                                        height: 800,
                                        child: pay.applePay(context,
                                            userID: db.get('id'),
                                            amountToPay:
                                                widget.amount.toString()),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
