import 'package:flutter/material.dart';
import 'package:portfolio/ui/social_info.dart';
import 'package:portfolio/widgets/build_input_file_with_keyboardtype.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final professionalNameController = TextEditingController();
  final aboutController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF4FF),
      appBar: AppBar(
        title: Text(
          "Personal Info",
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
                  SizedBox(height: 32),

                  BuildInputFileWithKeyboardtype(
                    label: "Full Name",
                    icon: Icons.person,
                    controller: fullNameController,
                    validatorMsg: "Enter your full name",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildInputFileWithKeyboardtype(
                    label: "Professional Name",
                    icon: Icons.badge,
                    controller: professionalNameController,
                    validatorMsg: "Enter your professional title",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildInputFileWithKeyboardtype(
                    label: "About You",
                    icon: Icons.info,
                    controller: aboutController,
                    validatorMsg: "Tell us something about you",
                    maxLines: 3,

                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildInputFileWithKeyboardtype(
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                    validatorMsg: "Enter a valid email",
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildInputFileWithKeyboardtype(
                    label: "Phone Number",
                    icon: Icons.phone,
                    controller: phoneController,
                    validatorMsg: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildInputFileWithKeyboardtype(
                    label: "Location",
                    icon: Icons.location_on,
                    controller: locationController,
                    validatorMsg: "Enter your location",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.040),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SocialMediaScreen(),
                          ),
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 42, 20, 103),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.040,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
