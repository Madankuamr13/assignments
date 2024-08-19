import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../service/api_service.dart';
import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiService apiService;
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final dio = Dio(); // Initialize Dio
    apiService = ApiService(dio);
    _fetchPosts();
  }

  void _fetchPosts() async {
    try {
      List<Post> fetchedPosts = await apiService.getPosts();
      setState(() {
        posts = fetchedPosts;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching posts: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
    );
  }
}