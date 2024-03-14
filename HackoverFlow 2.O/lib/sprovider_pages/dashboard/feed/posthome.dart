import 'package:flutter/material.dart';


class Post {
  final String username;
  final String content;

  Post(this.username, this.content);
}



class PostList extends StatelessWidget {
  final List<Post> posts = [
    Post('John Doe', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    Post('Jane Smith', 'Hello, Flutter! #coding #appdevelopment'),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 80, right: 12),
      child: ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(posts[index]);
      },
    ));
  }
}

class PostCard extends StatefulWidget {
  final Post post;

  PostCard(this.post);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.post.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.post.content),
            SizedBox(height: 8),
            Container(
              height: 300, // Set the desired height for the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80'), // Replace with the actual image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(Icons.thumb_up, color: isLiked ? Colors.blue : null),
                  label: Text('Like', style: TextStyle(color: isLiked ? Colors.blue : null)),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Handle comment functionality
                  },
                  icon: Icon(Icons.comment),
                  label: Text('Comment'),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Handle send functionality
                  },
                  icon: Icon(Icons.send),
                  label: Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



