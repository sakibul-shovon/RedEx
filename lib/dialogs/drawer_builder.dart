import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/apis.dart';
import '../helper/dialogs.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/upload_file_screen.dart';

class DrawerBuilder {
  final BuildContext context;

  DrawerBuilder(this.context);

  Widget buildDrawer() {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Column(
        children: <Widget>[
          // Drawer Header
          Container(
            color: Colors.grey[900],
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.grey[800]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // User Profile Image
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      user?.photoURL ??
                          'https://www.example.com/default_profile_image_url', // Default image if not available
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 15),
                  // User Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          user?.displayName ?? 'User Name',
                          // Display real user name or placeholder
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow
                                .ellipsis, // Truncate text if it's too long
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          user?.email ?? 'user@example.com',
                          // Display real user email or placeholder
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            overflow: TextOverflow
                                .ellipsis, // Truncate text if it's too long
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                buildDrawerItem(
                  icon: Icons.upload_file,
                  text: 'Upload PDF',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UploadFilesPage()),
                    );
                  },
                ),
                buildDrawerItem(
                  icon: Icons.account_balance_wallet,
                  text: 'Redex Balance',
                  onTap: () {
                    // Handle tap for Redex Balance
                  },
                ),
                buildDrawerItem(
                  icon: Icons.chat,
                  text: 'Redex Chats',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                ),
                buildDrawerItem(
                  icon: Icons.help_outline,
                  text: 'FAQ',
                  onTap: () {
                    // Handle tap for FAQ
                  },
                ),
                SizedBox(height: 20),
                // Spacer to move the logout button to the bottom
                buildDrawerItem(
                  icon: Icons.logout,
                  text: 'Log Out',
                  textColor: Colors.red[400]!,
                  iconColor: Colors.red[400]!,
                  onTap: () async {
                    Dialogs.showProgressBar(context);
                    await APIs.updateActiveStatus(false);
                    await APIs.auth.signOut().then((value) async {
                      await GoogleSignIn().signOut().then((value) {
                        Navigator.pop(context); // Hide progress dialog
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      });
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black87),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget buildEndDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Notification 1'),
            onTap: () {
              // Handle notification 1 tap
            },
          ),
          ListTile(
            title: const Text('Notification 2'),
            onTap: () {
              // Handle notification 2 tap
            },
          ),
        ],
      ),
    );
  }
}
