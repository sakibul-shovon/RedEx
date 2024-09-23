import 'dart:io';

import 'package:chting_app/api/apis.dart';
import 'package:chting_app/helper/dialogs.dart';
import 'package:chting_app/screens/auth/login_screen.dart';
import 'package:chting_app/screens/home_screen.dart';
import 'package:chting_app/screens/upload_file_screen.dart';
import 'package:chting_app/services/database_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  final DatabaseController _databaseController = DatabaseController();

  Future<void> _uploadImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _postNewsItem() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty || _imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      String imageUrl = '';
      if (_imageFile != null) {
        imageUrl = await _databaseController.uploadImage(_imageFile!);
      }

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not authenticated')),
        );
        return;
      }

      await _databaseController.addNewsItem(
        title: title,
        description: description,
        imageUrl: imageUrl,
      );

      _titleController.clear();
      _descriptionController.clear();
      setState(() {
        _imageFile = null;
      });
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post news item: $e')),
      );
    }
  }

  Future<void> _confirmDeletePost(String newsItemId) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      _deletePost(newsItemId);
    }
  }

  Future<void> _deletePost(String newsItemId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not authenticated')),
        );
        return;
      }

      // Fetch the post to check the author
      final postDoc = await FirebaseFirestore.instance
          .collection('news')
          .doc(newsItemId)
          .get();
      final postData = postDoc.data();
      final postAuthorId = postData?['authorId'];

      if (postAuthorId != user.uid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('You are not authorized to delete this post')),
        );
        return;
      }

      // Proceed to delete the post
      await FirebaseFirestore.instance
          .collection('news')
          .doc(newsItemId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete post: $e')),
      );
    }
  }

  Future<void> _toggleLike(String newsItemId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = user.uid;

    try {
      await _databaseController.toggleLike(
        newsItemId: newsItemId,
        userId: userId,
      );
    } catch (e) {
      print("Error toggling like: $e");
    }
  }

  Future<void> _addComment(String newsItemId, String comment) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      await _databaseController.addComment(
        newsItemId: newsItemId,
        comment: comment,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add comment: $e')),
      );
    }
  }






