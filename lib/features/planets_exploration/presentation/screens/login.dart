import 'package:flutter/material.dart';
import 'package:space_app/features/planets_exploration/presentation/screens/home_page.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff0E0E0E),
      body: Stack(
        children: [
          Positioned(
            left: -size.width * 0.45,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/login_planet.png",
              width: size.width * 1.3,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 16,
            left: size.width * 0.1,
            bottom: size.height * 0.36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Explore\nThe\nUniverse",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Positioned(
            right: 16,
            left: size.width * 0.02,
            bottom: size.height * 0.02,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEE403D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
