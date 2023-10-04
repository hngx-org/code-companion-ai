import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_payment/buttons/pay_buttons.dart';

enum Option { option1, option2 }

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  Option optionSelected = Option.option1;

  final pay = HNGPay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
              letterSpacing: 0.7),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueAccent,
              child: Text('D'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: Text(
                  'Welcome',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  'Code Campers',
                  style: TextStyle(
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
                height: 20,
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
              const Center(
                child: Text(
                  '\$3.99',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    (optionSelected == Option.option2)
                        ? SizedBox(
                            height: 30,
                            child: Center(
                              child: SizedBox(
                                width: 300,
                                height: 800,
                                child: pay.googlePay(amountToPay: '4'),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 30,
                            child: Center(
                              child: SizedBox(
                                width: 300,
                                height: 800,
                                child: pay.applePay(amountToPay: '4'),
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
    );
  }
}
