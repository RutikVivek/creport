import 'package:flutter/material.dart';
import 'package:portfolio/widgets/build_input_field_with_maxlines.dart';
import 'package:portfolio/widgets/custom_dropdown.dart';
import 'work_experience.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  final _formKey = GlobalKey<FormState>();

  final degreeController = TextEditingController();
  final institutionController = TextEditingController();
  final experienceController = TextEditingController();

  String? startYear;
  String? endYear;

  final List<String> years = List.generate(
    30,
    (index) => (2000 + index).toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF4FF),
      appBar: AppBar(
        title: Text(
          "Education!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 42, 20, 103),
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
                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  BuildInputFieldWithMaxlines(
                    label: "Degree",
                    icon: Icons.school,
                    controller: degreeController,
                    validatorMsg: "Enter your qualification",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildInputFieldWithMaxlines(
                    label: "Institution",
                    icon: Icons.account_balance,
                    controller: institutionController,
                    validatorMsg: "Enter your institution name",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  CustomDropDown(
                    labelText: "Start Year",
                    hintText: "Select Your Start Year",
                    items: years,
                    value: startYear,
                    onChanged: (value) {
                      setState(() {
                        startYear = value;
                      });
                    },
                    icon: Icons.calendar_month_outlined,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  CustomDropDown(
                    labelText: "End Year",
                    hintText: "Select Your End Year",
                    items: years,
                    value: endYear,
                    onChanged: (value) {
                      setState(() {
                        endYear = value;
                      });
                    },
                    icon: Icons.calendar_month_outlined,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildInputFieldWithMaxlines(
                    label: "Experience",
                    icon: Icons.work,
                    controller: experienceController,
                    validatorMsg: "Enter years of experience",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkExperience(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.040,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
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
