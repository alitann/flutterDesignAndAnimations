import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipments/data/data.dart';
import 'package:shipments/data/shipment.dart';

class ShipmentPage extends StatefulWidget {
  const ShipmentPage._();

  static void show({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const Material(child: ShipmentPage._()),
        settings: const RouteSettings(name: 'shipmentPage'),
      ),
    );
  }

  @override
  State<ShipmentPage> createState() => _ShipmentPageState();
}

class _ShipmentPageState extends State<ShipmentPage> {
  List<Shipment> _filteredData = [];

  String selectedType = 'All';

  void _filterList(String status) {
    setState(() {
      selectedType = status;
      if (status == 'All') {
        _filteredData = shipments;
      } else {
        _filteredData =
            shipments.where((item) => item.status == status).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(shipments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipments'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.deepPurple,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _ShipmentStatus(
                  title: 'All',
                  visibility: selectedType == 'All',
                  itemCount: shipments.length,
                  onClicked: (String value) {
                    _filterList(value);
                  },
                ),
                _ShipmentStatus(
                  title: 'Pending',
                  visibility: selectedType == 'Pending',
                  itemCount: shipments
                      .where((element) => element.status == 'Pending')
                      .length,
                  onClicked: (String value) {
                    _filterList(value);
                  },
                ),
                _ShipmentStatus(
                  title: 'In Progress',
                  visibility: selectedType == 'In Progress',
                  itemCount: shipments
                      .where((element) => element.status == 'In Progress')
                      .length,
                  onClicked: (String value) {
                    _filterList(value);
                  },
                ),
                _ShipmentStatus(
                  title: 'Completed',
                  visibility: selectedType == 'Completed',
                  itemCount: shipments
                      .where((element) => element.status == 'Completed')
                      .length,
                  onClicked: (String value) {
                    _filterList(value);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimatedListItem(
                  item: _filteredData[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ShipmentStatus extends StatelessWidget {
  const _ShipmentStatus({
    required this.title,
    required this.visibility,
    this.itemCount,
    required this.onClicked,
  });

  final String title;
  final bool visibility;
  final int? itemCount;
  final ValueChanged<String> onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClicked(title),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(width: 5),
                    if (itemCount != 0 && itemCount != null) ...[
                      CircleAvatar(
                        radius: 12,
                        backgroundColor:
                            visibility ? Colors.orange : Colors.deepPurple[100],
                        child: Text(
                          itemCount.toString(),
                          style: TextStyle(
                              color: visibility ? Colors.white : Colors.black),
                        ),
                      )
                    ],
                  ],
                ),
                Visibility(
                  visible: visibility,
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 1,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ShipmentCard extends StatelessWidget {
  const _ShipmentCard(this.shipment);

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/forklift.svg',
                                height: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                shipment.status,
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        shipment.title,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          shipment.description,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('${shipment.amount} - ${shipment.date}'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  SvgPicture.asset('assets/svg/forklift.svg', height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedListItem extends StatefulWidget {
  final Shipment item;

  const AnimatedListItem({super.key, required this.item});

  @override
  AnimatedListItemState createState() => AnimatedListItemState();
}

class AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
            scale: _animation.value, child: _ShipmentCard(widget.item));
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
