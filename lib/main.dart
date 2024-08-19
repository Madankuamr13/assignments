import 'package:flutter/material.dart';
import 'pages/posts_screen.dart'; // Import PostsScreen
import 'package:dio/dio.dart';
import 'service/api_service.dart'; // Import ApiService

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiService = ApiService(dio); // Initialize ApiService with Dio

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(apiService: apiService), // Pass ApiService to MainScreen
    );
  }
}

class MainScreen extends StatelessWidget {
  final ApiService apiService;

  MainScreen({required this.apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        backgroundColor: const Color.fromARGB(255, 243, 239, 250), // Set the AppBar color
      ),
      backgroundColor: const Color.fromARGB(255, 128, 193, 223), // Set the background color
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Hello, User!', // "Hello, User!" at the top-left corner
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                // Navigate to PostsScreen when the icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostsScreen(apiService: apiService), // Navigate to PostsScreen
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 80,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Go to Posts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
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