import 'package:flutter/material.dart';
import 'package:portfolio/ui/hobbies_screen.dart';
import 'package:portfolio/widgets/build_input_field.dart';

class AwardAndAchievementsScreen extends StatefulWidget {
  const AwardAndAchievementsScreen({super.key});

  @override
  State<AwardAndAchievementsScreen> createState() =>
      _AwardAndAchievementsScreenState();
}

class _AwardAndAchievementsScreenState
    extends State<AwardAndAchievementsScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final issuingOrgController = TextEditingController();
  final yearController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1FF),
      appBar: AppBar(
        title: const Text(
          "Awards & Achievements",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2A1467),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.070,
                    backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  BuildinputField(
                    label: "Award Title",
                    controller: titleController,
                    icon: Icons.emoji_events,
                    validatorMsg: "Please enter award title",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildinputField(
                    label: "Issuing Organization",
                    controller: issuingOrgController,
                    icon: Icons.business,
                    validatorMsg: "Please enter issuing organization",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildinputField(
                    label: "Year",
                    controller: yearController,
                    icon: Icons.calendar_today,
                    validatorMsg: "Please enter year",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildinputField(
                    label: "Description",
                    controller: descriptionController,
                    icon: Icons.description,
                    validatorMsg: "Please enter description",
                    maxLines: 4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const HobbiesAndInterestsScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.040,
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
      ),
    );
  }
}
