// ignore_for_file: use_build_context_synchronously

import 'package:code_companion_ai/app/presentation/auth/login/screens/change_password.dart';
import 'package:code_companion_ai/app/presentation/auth/login/screens/login_screen.dart';
import 'package:code_companion_ai/app/presentation/new%20payment/screen/payment_screen.dart';
import 'package:code_companion_ai/app/presentation/profile/provider/logout_provider.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../di/locator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final db = locator<HiveDB>();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<LogoutProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100, // Adjust the top position as needed
            left: -100, // Adjust the left position as needed
            child: Container(
              width: 300, // Adjust the width as needed
              height: 300, // Adjust the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor2.withOpacity(0.2), // Circle color
              ),
            ),
          ),
          Positioned(
            bottom: -100, // Adjust the bottom position as needed
            right: -100, // Adjust the right position as needed
            child: Container(
              width: 300, // Adjust the width as needed
              height: 300, // Adjust the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor.withOpacity(0.05), // Circle color
              ),
            ),
          ),
          SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColor.primaryColor2,
                      child: CircleAvatar(
                        radius: 37,
                        child: Text(
                          db.get('name').toString()[0].toUpperCase(),
                          style: AppTextStyle.black30Bold
                              .copyWith(color: AppColor.primaryColor2),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      db.get('name').toString().toUpperCase(),
                      style: const TextStyle(
                          color: AppColor.primaryColor2, fontSize: 22),
                    ),
                    const Gap(5),
                    Text(db.get('email').toString()),
                    const Gap(10),
                    const ListTile(
                      leading: Icon(
                        Icons.language_outlined,
                      ),
                      title: Text('Change Language'),
                    ),
                    const Gap(10),
                    ListTile(
                      leading: const Icon(
                        Icons.lock_reset_outlined,
                      ),
                      title: const Text('Change Password'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePassword()));
                      },
                    ),
                    const Gap(5),
                    ListTile(
                      leading: const Icon(
                        Icons.payment,
                      ),
                      title: const Text('Payment'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pay()));
                      },
                    ),
                    const Gap(5),
                    const ListTile(
                      leading: Icon(
                        Icons.info_outlined,
                      ),
                      title: Text('About app'),
                    ),
                    const Gap(10),
                    ListTile(
                      leading: const Icon(
                        Icons.exit_to_app_outlined,
                      ),
                      title: const Text('Log out'),
                      onTap: () {
                        showDialog<String>(
                            barrierColor:
                                AppColor.primaryColor4.withOpacity(0.4),
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Container(
                                    width: 250,
                                    height: 50,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primaryColor2,
                                    ),
                                    // color: Colors.yellow,
                                    child: const Row(
                                      children: [
                                        Icon(Icons.info,
                                            size: 40, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text(
                                          'Log out',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: AppColor.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  content: const Text(
                                      'Are you sure you want to log out?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: AppColor.primaryColor2),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        final result = await provider.logout();
                                        setState(() {});
                                        if (result) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen()));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          224, 246, 11, 11),
                                                  duration:
                                                      Duration(seconds: 2),
                                                  content: Text(
                                                      'Error logging out')));
                                        }
                                      },
                                      child: provider.isLoading
                                          ? const CircularProgressIndicator(
                                              color: AppColor.primaryColor2,
                                            )
                                          : const Text(
                                              'OK',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                    ),
                                  ],
                                ));
                      },
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
