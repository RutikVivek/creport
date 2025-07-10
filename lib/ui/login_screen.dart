import 'package:flutter/material.dart';
import 'package:portfolio/ui/signin.dart';
import 'package:portfolio/widgets/build_shadow_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Access me"),
        backgroundColor: Color.fromARGB(255, 42, 20, 103),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.0200,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.090,
                    backgroundImage: NetworkImage(
                      "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.038),

                  BuildShadowTextField(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.016,
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter your name"
                          : null,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildShadowTextField(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.016,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter your email"
                          : null,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildShadowTextField(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.016,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020),

                  BuildShadowTextField(
                    child: TextFormField(
                      controller: confirmpasswordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.016,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        } else if (value != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //    SnackBar(
                        //     content:
                        //         Text("Signup Successful (next page coming soon)"),
                        //   ),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signin()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.062,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
                    ),
                    child: Text("Sign Up"),
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
