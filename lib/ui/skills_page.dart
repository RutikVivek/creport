import 'package:flutter/material.dart';
import 'package:portfolio/data/appdata.dart';
import 'package:portfolio/ui/education_info.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<bool?> selectedValues = List<bool?>.filled(skills.length, false);
  List<String> selectedSkills = [];
  Map<String, String> skillRatings = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF4FF),
      appBar: AppBar(
        title: Text(
          'Skills Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 42, 20, 103),
        elevation: 5,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.025,
                top: MediaQuery.of(context).size.height * 0.020,
                bottom: MediaQuery.of(context).size.height * 0.010,
              ),
              child: Text(
                '3. Select Skills',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.017,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  final isSelected = selectedValues[index] ?? false;

                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.016,
                      vertical: MediaQuery.of(context).size.height * 0.08,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.012,
                      ),
                    ),
                    elevation: 2,
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text(skill),
                          value: isSelected,
                          activeColor: Colors.deepPurple,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (value) {
                            setState(() {
                              selectedValues[index] = value;
                              if (value == true) {
                                selectedSkills.add(skill);
                                skillRatings[skill] = ratings.first;
                              } else {
                                selectedSkills.remove(skill);
                                skillRatings.remove(skill);
                              }
                            });
                          },
                        ),
                        if (isSelected)
                          Column(
                            children: ratings.map((rating) {
                              return RadioListTile<String>(
                                title: Text(rating),
                                value: rating,
                                groupValue: skillRatings[skill],
                                onChanged: (value) {
                                  setState(() {
                                    skillRatings[skill] = value!;
                                  });
                                },
                                activeColor: Colors.purple,
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EducationInfo()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.010,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.030,
                    vertical: MediaQuery.of(context).size.height * 0.012,
                  ),
                ),
                child: Text(
                  "Next Page",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.014,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
          ],
        ),
      ),
    );
  }
}
