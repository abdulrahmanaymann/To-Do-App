import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  final String payload;

  @override
  // ignore: library_private_types_in_public_api
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
          ),
        ),
        elevation: 0,
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        title: Text(
          _payload.toString().split('|')[0],
          style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'Hello, Abdulrahman',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Get.isDarkMode ? Colors.white : darkGreyClr),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'You have a new reminder',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: primaryClr),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.text_format,
                            size: 35,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Title',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _payload.toString().split('|')[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.description,
                            size: 35,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _payload.toString().split('|')[1],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Date',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _payload.toString().split('|')[2],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
