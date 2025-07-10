import 'package:flutter/material.dart';
import 'package:portfolio/ui/skills_page.dart';
import 'package:portfolio/widgets/build_input_custom_field.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  final linkedinController = TextEditingController();
  final twitterController = TextEditingController();
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final threadsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1FF),
      appBar: AppBar(
        title: Text("Social Links", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF2A1467),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.024),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // 🖼️ Image on Top
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                BuildInputCustomField(
                  label: "LinkedIn",
                  controller: linkedinController,
                  icon: Icons.link,
                  hasCertification: "",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                BuildInputCustomField(
                  label: "Twitter",
                  controller: twitterController,
                  icon: Icons.alternate_email,
                  hasCertification: "",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                BuildInputCustomField(
                  label: "Facebook",
                  controller: facebookController,
                  icon: Icons.facebook,
                  hasCertification: "",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                BuildInputCustomField(
                  label: "Instagram",
                  controller: instagramController,
                  icon: Icons.camera_alt,
                  hasCertification: "",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                BuildInputCustomField(
                  label: "Threads",
                  controller: threadsController,
                  icon: Icons.chat_bubble,
                  hasCertification: "",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SkillsPage()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
