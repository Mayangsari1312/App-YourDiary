import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
                    "Terms of Use",
                    style:
                        boldTextStyle.copyWith(color: blueColor, fontSize: 20),
                  ),
                  Image.asset("assets/logo.png", width: 60),
                ],
              ),
            ),
            //
            Text(
              'YourDiary Application - Version 1.0',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
              'Last Updated: December 6th, 2024',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'These Terms of Use govern your use of the YourDiary application provided by YourDiary, Inc. By accessing or using the Application, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the Application.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 16.0),
            Text(
              'Acceptance of Terms',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text('Personal Information:',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                'By using the YourDiary application, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, you may not use the Application.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'License',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'Subject to your compliance with these Terms, we grant you a limited, non-exclusive, non-transferable, revocable license to use the YourDiary Application for your personal, non-commercial use.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'User Accounts',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'To use certain features of the YourDiary Application, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'Content',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'You acknowledge and agree that all content available through the Application is the sole property of YourDiary or its licensors. You may not modify, reproduce, distribute, or create derivative works based on any content without the express consent of YourDiary.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'Prohibited Conduct',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text('You agree not to:',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('a. Violate any applicable laws or regulations',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                'b. Use the Application for any unlawful or unauthorized purpose',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                'c. Interfere with or disrupt the operation of the Application',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('d. Transmit any viruses or other harmful code',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text(
                'e. Engage in any form of automated data collection, including scraping ',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('or crawling the Application.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'Privacy',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'Your use of the Application is also governed by our Privacy Policy, which is incorporated by reference into these Terms.',
                style: regulerTextStyle.copyWith(color: blueColor)),
            const SizedBox(height: 24.0),
            Text(
              'Contact Information:',
              style: boldTextStyle.copyWith(color: blueColor),
            ),
            Text(
                'If you have any questions about these Terms, please contact us at yourdiary@gmail.com',
                style: regulerTextStyle.copyWith(color: blueColor)),
            Text('Thank you for using YourDiary!',
                style: regulerTextStyle.copyWith(color: blueColor))
          ],
        ),
      ),
    );
  }
}
