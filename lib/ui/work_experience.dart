import 'package:flutter/material.dart';
import 'package:portfolio/ui/project_screen.dart';
import 'package:portfolio/widgets/build_input_field_with_maxlines.dart';
import 'package:portfolio/widgets/date_picker.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final _formKey = GlobalKey<FormState>();

  final jobTitleController = TextEditingController();
  final companyNameController = TextEditingController();
  final yearsOfExperienceController = TextEditingController();
  final responsibilitiesController = TextEditingController();

  String? startDate;
  String? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF4FF),
      appBar: AppBar(
        title: Text(
          "Work Experience",
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
                    radius: MediaQuery.of(context).size.height * 0.080,
                    backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  BuildInputFieldWithMaxlines(
                    label: "Job Title",
                    controller: jobTitleController,
                    icon: Icons.work,
                    validatorMsg: "Enter job title",
                    maxLines: 1,
                  ),
                  SizedBox(height: 20),
                  BuildInputFieldWithMaxlines(
                    label: "Company Name",
                    controller: companyNameController,
                    icon: Icons.business,
                    validatorMsg: "Enter company name",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  DatePicker(
                    label: "Start Date",
                    value: startDate ?? "",
                    icon: Icons.calendar_today,
                    onTap: () => _pickDate(
                      context: context,
                      label: "Start Date",
                      onSelectedDate: (date) {
                        setState(() {
                          startDate = date;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  DatePicker(
                    label: "End Date",
                    value: endDate ?? "",
                    icon: Icons.calendar_today,
                    onTap: () => _pickDate(
                      context: context,
                      label: "End Date",
                      onSelectedDate: (date) {
                        setState(() {
                          endDate = date;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildInputFieldWithMaxlines(
                    label: "Years of Experience",
                    controller: yearsOfExperienceController,
                    icon: Icons.access_time,
                    validatorMsg: "Enter years of experience",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildInputFieldWithMaxlines(
                    label: "Responsibilities",
                    controller: responsibilitiesController,
                    icon: Icons.description,
                    validatorMsg: "Enter responsibilities",
                    maxLines: 5,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectPortfolioScreen(),
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

Future<void> _pickDate({
  required BuildContext context,
  required String label,
  required void Function(String) onSelectedDate,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2050),
  );

  if (picked != null) {
    final formattedDate = "${picked.day}/${picked.month}/${picked.year}";
    onSelectedDate(formattedDate);
  }
}
