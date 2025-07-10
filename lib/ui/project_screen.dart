import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/ui/cerification_screen.dart';
import 'package:portfolio/widgets/build_input_field_with_maxlines.dart'; // Ensure this path is correct

class ProjectPortfolioScreen extends StatefulWidget {
  const ProjectPortfolioScreen({super.key});

  @override
  State<ProjectPortfolioScreen> createState() => _ProjectPortfolioScreenState();
}

class _ProjectPortfolioScreenState extends State<ProjectPortfolioScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final techUsedController = TextEditingController();
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1FF),
      appBar: AppBar(
        title: Text(
          "Project Portfolio",
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
                    label: "Project Title",
                    controller: titleController,
                    icon: Icons.title,
                    validatorMsg: "Please enter a title",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildInputFieldWithMaxlines(
                    label: "Description",
                    controller: descriptionController,
                    icon: Icons.description,
                    validatorMsg: "Please enter a description",
                    maxLines: 4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                  BuildInputFieldWithMaxlines(
                    label: "Technologies Used",
                    controller: techUsedController,
                    icon: Icons.code,
                    validatorMsg: "Please mention technologies used",
                    maxLines: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  // Upload Section
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.012,
                        ),
                        border: Border.all(color: Colors.grey),
                        image: _imageFile != null
                            ? DecorationImage(
                                image: FileImage(_imageFile!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _imageFile == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    size:
                                        MediaQuery.of(context).size.height *
                                        0.040,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.010,
                                  ),
                                  Text(
                                    "Upload Project Image",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          : null,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CertificationScreen(),
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
