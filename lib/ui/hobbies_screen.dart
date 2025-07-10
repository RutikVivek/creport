import 'package:flutter/material.dart';
import 'package:portfolio/ui/contact_screen.dart';
import 'package:portfolio/widgets/build_input_field_with_maxlines.dart';

class HobbiesAndInterestsScreen extends StatefulWidget {
  const HobbiesAndInterestsScreen({super.key});

  @override
  State<HobbiesAndInterestsScreen> createState() =>
      _HobbiesAndInterestsScreenState();
}

class _HobbiesAndInterestsScreenState extends State<HobbiesAndInterestsScreen> {
  final _formKey = GlobalKey<FormState>();
  final hobbiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1FF),
      appBar: AppBar(
        title: Text(
          "Hobbies & Interests",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF2A1467),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.020),
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
                  BuildInputFieldWithMaxlines(
                    label: "List your hobbies & interests (comma separated)",
                    controller: hobbiesController,
                    icon: Icons.sports_handball,
                    validatorMsg: "Please enter at least one hobby",
                    maxLines: 4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactScreen(),
                          ),
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
                        borderRadius: BorderRadius.circular(12),
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
