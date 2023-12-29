import 'package:flutter/material.dart';
import 'package:miniblogstudy/models/blog.dart';
import 'package:miniblogstudy/screens/detail_screen.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        print("İlk if");
        return InkWell(
          child: Card(
            color: Colors.yellow,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Container(
                          width: double.infinity,
                          child:
                              Center(child: Image.network(blog.thumbnail!)))),
                  ListTile(
                    title: Text(blog.title!),
                    subtitle: Text(blog.author!),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => DetailScreen(blogId: blog.id!)));
          },
        );
      } else {
        return InkWell(
          child: Card(
            color: Colors.green,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Container(
                          width: double.infinity,
                          child:
                              Center(child: Image.network(blog.thumbnail!)))),
                  ListTile(
                    title: Text(blog.title!),
                    subtitle: Text(blog.author!),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => DetailScreen(blogId: blog.id!)));
          },
        );
      }
    });
  }
}
