  import 'package:flutter/material.dart';
  import 'package:url_launcher/url_launcher.dart';
  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Business Card',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),  
        home: const BusinessCard(),
      );
    }
  }

  class BusinessCard extends StatelessWidget {
    const BusinessCard({super.key});

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'your.email@example.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  void _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+639171234567',
    );
    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Now update our container width
    width: screenWidth > 600 ? 600 : screenWidth * 0.9;

      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: Card(
            elevation: 4,
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                      image: DecorationImage(
                        image: NetworkImage('YOUR_IMAGE_URL'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Adrian Escudero',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 104, 173),
                    ),
                  ),
                  const Text(
                    'Flutter, Nextjs, React Native Developer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 36, 23, 23),
                    ),
                  ),
                  const Divider(height: 32, thickness: 1),
                  const ListTile(
                    leading: Icon(Icons.email, color: Colors.teal),
                    title: Text('xidesadrian@gmail.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal),
                    title: Text('+639484817992'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on, color: Colors.teal),
                    title: Text('Davao City, Philippines'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

