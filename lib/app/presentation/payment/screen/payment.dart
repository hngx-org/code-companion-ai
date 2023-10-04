import 'package:code_companion_ai/app/presentation/onboarding/screens/onboarding.dart';
import 'package:code_companion_ai/app/presentation/payment/screen/payement_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

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
                  'Abuzer Firdousi',
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
                  const Text(
                    'Choose Payment Method',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RadioWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Card Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Card Number',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                height: 52,
                                margin: const EdgeInsets.only(top: 8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(12),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16)
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please a valid card number';
                                    } else if (value.length != 16) {
                                      return 'must be 16 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Card Number',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                  ),
                                  autofocus: false,
                                  controller: _cardNumberController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Expiry Date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      height: 52,
                                      margin: const EdgeInsets.only(top: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                12),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please a valid Date';
                                          } else if (value.length != 5) {
                                            return 'must be 5 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'MM/YY',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                        ),
                                        autofocus: false,
                                        controller: _expiryDateController,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'CVV',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      height: 52,
                                      margin: const EdgeInsets.only(top: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                12),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(3)
                                        ],
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please a valid CVV';
                                          } else if (value.length != 3) {
                                            return 'must be 3 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'CVV',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                        ),
                                        autofocus: false,
                                        controller: _cvvController,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '\$4.99',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomContainer(
                  fillColor: Colors.purpleAccent,
                  width: 280,
                  height: 50,
                  useShadow: false,
                  borderColor: Colors.white,
                  borderRadius: 40,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const PaymentSuccess()));
                      },
                      child: const Text(
                        'Pay',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

enum Option { option1, option2 }

class _RadioWidgetState extends State<RadioWidget> {
  Option optionSelected = Option.option1;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              }),
        ),
      ],
    );
  }
}
