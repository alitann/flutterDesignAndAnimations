import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipments/view/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animated = false;

  TextStyle get _titleStyle {
    return const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    );
  }

  TextStyle get _subtitleStyle {
    return const TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 180,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    child: SvgPicture.asset(
                      'assets/svg/person.svg',
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your location',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      Text(
                        'Istanbul, Turkey',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/svg/notifications.svg',
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                onTap: () => SearchPage.show(context: context),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  hintText: "Enter the receipt number ...",
                  fillColor: Colors.white,
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.add_road, color: Colors.white),
                    ),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Tracking',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Shipment number', style: _titleStyle),
                                Text('NEJ200893345345', style: _subtitleStyle),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/svg/forklift.svg',
                              height: 50,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/package_box.svg',
                                  height: 40,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Sender', style: _titleStyle),
                                    Text('Istanbul', style: _subtitleStyle),
                                  ],
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Time', style: _titleStyle),
                                      Text(
                                        '* 2 - 3 days ',
                                        style: _subtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/package_box.svg',
                                  height: 40,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Receiver', style: _titleStyle),
                                    Text('Istanbul', style: _subtitleStyle),
                                  ],
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status',
                                        style: _titleStyle,
                                      ),
                                      Text('Waiting to collect',
                                          style: _subtitleStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                    child: const Text(
                      '+ Add Stop',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Available Vehicles',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        _ShopImage(
                          imagePath: 'assets/images/ship.png',
                          title: 'Ocean freight',
                          subtitle: 'International',
                        ),
                        _ShopImage(
                          imagePath: 'assets/images/truck.png',
                          title: 'Cargo freight',
                          subtitle: 'Reliable',
                        ),
                        _ShopImage(
                          imagePath: 'assets/images/airplane.png',
                          title: 'Air freight',
                          subtitle: 'International',
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShopImage extends StatefulWidget {
  const _ShopImage(
      {required this.imagePath, required this.title, required this.subtitle});

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  State<_ShopImage> createState() => _ShopImageState();
}

class _ShopImageState extends State<_ShopImage> {
  bool animated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(
        const Duration(seconds: 3),
        (timer) {
          setState(() {
            animated = true;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 160,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                AnimatedPositioned(
                  onEnd: () {
                    setState(() {
                      animated = false;
                    });
                  },
                  duration: const Duration(seconds: 3),
                  bottom: animated ? 0 : 50,
                  right: animated ? -20 : -60,
                  child: Image.asset(widget.imagePath, width: 120),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
