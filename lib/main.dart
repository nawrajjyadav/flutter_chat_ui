import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with your avatar asset
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jhon Abraham', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Active now', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call, color: Colors.black)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text('Today'),
              backgroundColor: Colors.grey[200],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                chatBubble('Hello! Jhon Abraham', true, '09:25 AM'),
                chatBubble('Hello! Nawraj! How are you?', false, '09:25 AM'),
                chatBubble('You did your job well!', true, '09:26 AM'),
                chatBubble('Have a great working week!', false, '09:55 AM'),
                chatBubble('Hope you like it', false, '09:55 AM'),
                audioMessageBubble('00:16', '09:56 AM'),
              ],
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.attach_file, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.photo, color: Colors.grey),
                SizedBox(width: 8),
                Icon(Icons.camera_alt, color: Colors.grey),
                SizedBox(width: 8),
                Icon(Icons.mic, color: Colors.grey),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget chatBubble(String message, bool isOutgoing, String time) {
    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isOutgoing ? Colors.green[100] : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(isOutgoing ? 12 : 0),
            bottomRight: Radius.circular(isOutgoing ? 0 : 12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            SizedBox(height: 4),
            Text(time, style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget audioMessageBubble(String duration, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.play_arrow, size: 20),
                Expanded(
                  child: Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.grey,
                    // Placeholder for waveform visualization
                  ),
                ),
                Text(duration),
              ],
            ),
            SizedBox(height: 4),
            Text(time, style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

