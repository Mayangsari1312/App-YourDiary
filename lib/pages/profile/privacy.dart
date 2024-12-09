import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, left: 15, right: 15, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage()));
                        },
                        child: Image.asset("assets/back.png"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: blueColor,
                          backgroundColor:
                              blue2Color, // ini warnanya masih salah
                          shape: CircleBorder(),
                          minimumSize: Size(10, 60),
                        )),
                  ),
                  Text(
                    "Privacy Policy",
                    style:
                        boldTextStyle.copyWith(color: blueColor, fontSize: 20),
                  ),
                  Image.asset("assets/logo.png", width: 60),
                ],
              ),
            ),
            //
            Text(
              'YourDiary App Privacy Policy',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
              'Last Updated: December 6th, 2024',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
              'Welcome to the YourDiary Application. We appreciate your trust and are committed to protecting your personal information. This privacy policy is designed to help you understand how we collect, use, and safeguard the personal information you provide when using the YourDiary App. By using the YourDiary App, you agree to the collection and use of information in accordance with this privacy policy. If you disagree with any part of this privacy policy, please refrain from using the YourDiary App.',
              style: regulerTextStyle.copyWith(color: blueColor),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text('Personal Information:',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                'When you register or use our services, we may collect personal information such as your name, email address, and other account information.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('Non-Personal Information:',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                'We may also collect non-personal information, such as App usage data, user preferences, and statistics related to App usage.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'How We Use Your Information',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text('- Provide, operate, and maintain the YourDiary App.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('- Improve and develop the Soul Serenity App.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                '- Send updates, notifications, and information related to our services.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('- Respond to your inquiries, comments, or requests.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'How We Protect Your Information',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'We take reasonable security measures to protect your personal information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is entirely secure.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'Changes to This Privacy Policy',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'We may update this privacy policy from time to time. Changes will be communicated to you by updating the "Last Updated" date at the top of this privacy policy.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'Contact Us',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'If you have questions or concerns about this privacy policy, please contact us at yourdiary@gmail.com .',
                style: regulerTextStyle.copyWith(color: blueColor)),
          ],
        ),
      ),
    );
  }
}
