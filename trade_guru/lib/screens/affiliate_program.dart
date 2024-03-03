import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/widgets/my_text_field.dart';

class AffiliateProgram extends StatefulWidget {
  const AffiliateProgram({super.key});

  @override
  State<AffiliateProgram> createState() => _AffiliateProgramState();
}

class _AffiliateProgramState extends State<AffiliateProgram> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.affiliateProgram),
        centerTitle: true,
        backgroundColor: const Color(0xFF131723),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF0A0A0A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Lang.pleaseFillTheInformationBelowToJoinOurAffiliateProgram,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 50),
            MyTextField(
              label: Lang.name,
              controller: _nameController,
              keyboardType: TextInputType.name,
              icon: Icons.person_2_outlined,
            ),
            const SizedBox(height: 20),
            MyTextField(
                label: Lang.email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined),
            const SizedBox(height: 20),
            MyTextField(
                label: Lang.phoneWithCountryCode,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                icon: Icons.phone_outlined),
            const SizedBox(height: 50),
            FilledButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 10,
                  ),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: sendEmail,
                child: Text(
                  Lang.submit,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Lang.pleaseFillAllTheFields),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Lang.pleaseEnterAValidEmail),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final Email email = Email(
      body: '''
      Name: ${_nameController.text}
      Email: ${_emailController.text}
      Phone: ${_phoneController.text}
      ''',
      subject: 'Affiliate Program Application',
      recipients: ['support@tradeguru.io'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
