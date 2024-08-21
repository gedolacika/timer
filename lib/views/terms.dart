import 'package:alpar_counter_app/theme.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CustomTheme.color(CustomColors.main_yellow),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
        color: Colors.grey[900],
        child: ListView(
          children: [
            _TermsItem(
                description:
                    'Ludicus Games SRL built the Ludichrono app as a Free app. This SERVICE is provided by Ludicus Games SRL at no cost and is intended for use as is.'),
            _TermsItem(
                description:
                    'This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.'),
            _TermsItem(
                description:
                    'If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.'),
            _TermsItem(
                description:
                    'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Ludichrono unless otherwise defined in this Privacy Policy.'),
            _TermsItem(
                title: 'Information Collection and Use',
                description:
                    'For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained on your device and is not collected by us in any way.'),
            _TermsItem(description: 'The app does use third party services that may collect information used to identify you.'),
            _TermsItem(
                description:
                    'Link to privacy policy of third party service providers used by the app Google Play Services - https://www.google.com/policies/privacy/'),
            _TermsItem(
                title: 'Log Data',
                description:
                    'We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.'),
            _TermsItem(
                title: 'Cookies',
                description:
                    "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory."),
            _TermsItem(
                description:
                    "This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
            _TermsItem(
                title: "Service Providers",
                description:
                    "We may employ third-party companies and individuals due to the following reasons: to facilitate our Service, to provide the Service on our behalf, to perform Service-related services, to assist us in analyzing how our Service is used"),
            _TermsItem(
                description:
                    "We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
            _TermsItem(
                title: "Security",
                description:
                    "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."),
            _TermsItem(
                title: "Links to Other Sites",
                description:
                    "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
            _TermsItem(
                title: "Children’s Privacy",
                description:
                    "These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions."),
            _TermsItem(
                title: "Changes to This Privacy Policy",
                description:
                    "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page."),
            _TermsItem(
                title: "Contact Us",
                description: "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.")
          ],
        ),
      ),
    );
  }
}

class _TermsItem extends StatelessWidget {
  _TermsItem({Key? key, this.title, this.description}) : super(key: key);

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          if (description != null) SizedBox(height: 8),
          if (description != null)
            Text(
              description!,
              style: TextStyle(
                color: Colors.white,
              ),
            )
        ],
      ),
    );
  }
}
