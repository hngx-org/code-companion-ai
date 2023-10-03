import 'package:code_companion_ai/app/presentation/chat/screen/chat_screen.dart';
import 'package:code_companion_ai/app/presentation/profile/profile.dart';
import 'package:code_companion_ai/app/presentation/saved/screens/saved_screen.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _routes = [
    const ChatScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex == 0) return true;
        goToScreen(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: _routes[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.white,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            goToScreen(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: NavBarItem(
                iconPath: Icons.chat_bubble_rounded,
                label: "Chat",
                color: AppColor.grey,
              ),
              activeIcon: NavBarItem(
                iconPath: Icons.chat_bubble_rounded,
                label: "Chat",
                isActive: true,
                color: AppColor.primaryColor2,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem(
                iconPath: Icons.star_border_rounded,
                label: "Saved",
                color: AppColor.grey,
              ),
              activeIcon: NavBarItem(
                iconPath: Icons.star_border_rounded,
                label: "Saved",
                isActive: true,
                color: AppColor.primaryColor2,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem(
                iconPath: Icons.person_rounded,
                label: "Profile",
                color: AppColor.grey,
              ),
              activeIcon: NavBarItem(
                iconPath: Icons.person_rounded,
                label: "Profile",
                isActive: true,
                color: AppColor.primaryColor2,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  goToScreen(int value) {
    currentIndex = value;
    setState(() {});
  }
}

class NavBarItem extends StatelessWidget {
  final IconData iconPath;
  final String label;
  final Color color;
  final bool? isActive;

  const NavBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.color,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image.asset(
        //   iconPath,
        //   // ignore: deprecated_member_use
        //   color: color,
        // ),
        Icon(
          iconPath,
          color: color,
        ),
        const Gap(1),
        Text(
          label,
          style: AppTextStyle.black12Bold.copyWith(color: color),
        ),
        const Gap(2),
        isActive != null
            ? CircleAvatar(
                radius: 3,
                backgroundColor: color,
              )
            : Container()
      ],
    );
  }
}
