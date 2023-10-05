import 'package:code_companion_ai/app/presentation/new%20payment/screen/payment_screen.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubscriptionOptions extends StatelessWidget {
  const SubscriptionOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your Plan!",
              style: AppTextStyle.black30Bold
                  .copyWith(color: AppColor.primaryColor2),
            ),
            const Gap(20),
            options(
                option: 'Free',
                onTap: () {},
                icon: Icons.money_off,
                info: const Column(
                  children: [
                    Text(
                      '3 free Credits',
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      'Free Forever',
                      style: TextStyle(color: AppColor.white),
                    )
                  ],
                )),
            options(
                option: 'Plus',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pay(amount: 3)));
                },
                price: '3',
                icon: Icons.star_border,
                info: const Column(
                  children: [
                    Text(
                      'More Credits',
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      'More usage',
                      style: TextStyle(color: AppColor.white),
                    )
                  ],
                )),
            options(
                option: 'Premium',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pay(amount: 5)));
                },
                price: '5',
                icon: Icons.workspace_premium_outlined,
                info: const Column(
                  children: [
                    Text(
                      'More Credits',
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      'Fsster response',
                      style: TextStyle(color: AppColor.white),
                    ),
                    Text(
                      'Premium membersip',
                      style: TextStyle(color: AppColor.white),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

Widget options(
    {double? width,
    double? height,
    required String option,
    required VoidCallback onTap,
    required IconData icon,
    Widget? info,
    String? price}) {
  return InkWell(
    onTap: onTap,
    child: Card(
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColor.primaryColor4,
                AppColor.primaryColor3.withOpacity(0.7),
                AppColor.primaryColor2.withOpacity(0.7),
                AppColor.primaryColor.withOpacity(0.7)
              ]),
          borderRadius: BorderRadius.circular(10)),
      width: width ?? double.maxFinite,
      height: height ?? 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
              ),
              const Gap(20),
              Text(
                option,
                style: AppTextStyle.black14Thick,
              )
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '\$${price ?? '0'}',
              style: AppTextStyle.black25Bold.copyWith(color: AppColor.white),
            ),
            info ?? const SizedBox()
          ]),
          const Gap(20)
        ],
      ),
    )),
  );
}
