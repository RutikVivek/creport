import 'package:flutter/material.dart';
import 'package:portfolio/ui/awards_screen.dart';
import 'package:portfolio/widgets/build_input_custom_field.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  final _formKey = GlobalKey<FormState>();

  final certNameController = TextEditingController();
  final orgController = TextEditingController();
  final dateController = TextEditingController();
  final urlController = TextEditingController();

  String? hasCertification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1FF),
      appBar: AppBar(
        title: Text("Certifications", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF2A1467),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.070,
                  backgroundImage: NetworkImage(
                    "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                Text(
                  "Do you have any certifications?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "yes",
                      groupValue: hasCertification,
                      onChanged: (value) {
                        setState(() {
                          hasCertification = value;
                        });
                      },
                    ),
                    Text("Yes"),
                    Radio<String>(
                      value: "no",
                      groupValue: hasCertification,
                      onChanged: (value) {
                        setState(() {
                          hasCertification = value;
                        });
                      },
                    ),
                    Text("No"),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                if (hasCertification == "yes") ...[
                  BuildInputCustomField(
                    label: "Certification Name",
                    controller: certNameController,
                    icon: Icons.card_membership,
                    hasCertification: hasCertification,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                  BuildInputCustomField(
                    label: "Issuing Organization",
                    controller: orgController,
                    icon: Icons.business,
                    hasCertification: hasCertification,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                  BuildInputCustomField(
                    label: "Date",
                    controller: dateController,
                    icon: Icons.calendar_today,
                    hasCertification: hasCertification,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                  BuildInputCustomField(
                    label: "Certificate URL",
                    controller: urlController,
                    icon: Icons.link,
                    hasCertification: hasCertification,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                ],

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (hasCertification == "yes" &&
                          _formKey.currentState!.validate()) {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AwardAndAchievementsScreen(),
                            ),
                          );
                        }
                      } else if (hasCertification == "no") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No Certifications")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.040,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.012,
                        ),
                      ),
                      elevation: 8,
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
