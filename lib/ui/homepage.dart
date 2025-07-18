import 'package:flutter/material.dart';
import 'personal_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF2A1467),
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.0022,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0024),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.0090,
                backgroundImage: NetworkImage(
                  "https://epe.brightspotcdn.com/dims4/default/75a0bb5/2147483647/strip/true/crop/884x600+95+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.us-east-1.amazonaws.com%2Fe3%2F9d%2F5725af984dce8e6db0ba690f9b29%2F052024-story-embed-cosn-data-lead-art-langreo-vs.png",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0030),
              Text(
                "Portfolio Maker is an innovative and user-friendly application designed to empower individuals, professionals, and businesses to create stunning, personalized portfolios with ease. Whether you are a freelancer showcasing your skills, a student presenting your academic journey, a business displaying its services, or a client organizing project highlights — this tool offers a seamless solution to build a strong digital presence.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.0016,
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.00195,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0030),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.0024,
                  horizontal: MediaQuery.of(context).size.height * 0.0016,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.0020,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Create Your Own Portfolio",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0020,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0030,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalInfoPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.0040,
                          vertical: MediaQuery.of(context).size.height * 0.0016,
                        ),
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.0012,
                          ),
                        ),
                        elevation: 8,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0016,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
