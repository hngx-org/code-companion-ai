import 'package:code_companion_ai/app/di/locator.dart';
import 'package:code_companion_ai/app/presentation/auth/login/providers/login_provider.dart';
import 'package:code_companion_ai/app/presentation/auth/sign_up/providers/sign_up_provider.dart';
import 'package:code_companion_ai/app/presentation/chat/provider/chat_provider.dart';
import 'package:code_companion_ai/app/presentation/onboarding/screens/onboarding.dart';
import 'package:code_companion_ai/app/presentation/payment/screen/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// void main() async{
//   await setupLocator();
//   runApp(
//    const CodeCompanion()
//   );
// }
void main() async {
  await setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ///// YOU ARE TO DUPLICATE THIS LINE FOR EVERY PROVIDER
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const CodeCompanion(),
    ),
  );
}

class CodeCompanion extends StatelessWidget {
  const CodeCompanion({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const PaymentScreen(),
    );
  }
}
