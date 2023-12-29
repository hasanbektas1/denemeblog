import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblogstudy/models/blog.dart';
import 'package:miniblogstudy/screens/add_blog.dart';
import 'package:miniblogstudy/widgets/blog_item.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Blog> blogs = [];
  List<Blog> reversedBlogs = [];

  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  fetchBlogs() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final List jsonData = json.decode(response.body);

    setState(() {
      blogs = jsonData.map((json) => Blog.fromJson(json)).toList();
      reversedBlogs = blogs.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        print("İlk if");

        return Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              title: const Text("Bloglar"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => AddBlog()));
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            body: reversedBlogs.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async {
                      fetchBlogs();
                    },
                    child: ListView.builder(
                        itemBuilder: (context, index) =>
                            BlogItem(blog: reversedBlogs[index]),
                        itemCount: reversedBlogs.length),
                  ));
      } else {
        print("else Home page");

        return Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
              title: const Text("Bloglar"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => AddBlog()));
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            body: reversedBlogs.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async {
                      fetchBlogs();
                    },
                    child: ListView.builder(
                        itemBuilder: (context, index) =>
                            BlogItem(blog: reversedBlogs[index]),
                        itemCount: reversedBlogs.length),
                  ));
      }
    });
  }
}
