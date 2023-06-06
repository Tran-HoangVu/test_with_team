import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  void sendMessage(String message) {
    print('Your mess: $message');
    WebSocketChannel channel;
    try {
      channel = WebSocketChannel.connect(Uri.parse('ws://172.19.200.108:3010'));
      channel.sink.add(message);
      channel.stream.listen((message) {
        print(message);
        channel.sink.close();
      });
      print('oke 2');
    } catch (e) {
      print(e);
    }
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: 'Enter your message here'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        sendMessage(controller.text);
                      }
                    },
                    child: const Center(
                      child: Text('Click'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
