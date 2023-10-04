import 'package:code_companion_ai/app/presentation/auth/login/screens/change_password.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColor.primaryColor2,
                      child: CircleAvatar(
                        radius: 37,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                          color: AppColor.primaryColor2, fontSize: 22),
                    ),
                    const Gap(5),
                    const Text('johndoe@x.com'),
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
                    const Gap(10),
                    const ListTile(
                      leading: Icon(
                        Icons.info_outlined,
                      ),
                      title: Text('About app'),
                    ),
                    const Gap(10),
                    const ListTile(
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                      ),
                      title: Text('Log out'),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
