import 'package:flutter/material.dart';
import 'package:pertemuan5/main.dart';
// import 'package:pertemuan5/page/beranda_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1504805572947-34fad45aed93",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -60,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1725653811863-8ca1776e126a",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 70),

              // NAME
              const Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 10),

              // LOCATION
              const Text(
                "Jakarta, Indonesia",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 10),

              // JOB
              const Text(
                "Flutter Software Engineer",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 20),

              // STATS CARD
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Column(
                        children: [
                          Text(
                            "Project",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "16",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "2308",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
