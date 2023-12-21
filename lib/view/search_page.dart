import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipments/data/data.dart';
import 'package:shipments/data/shipment.dart';
import 'package:shipments/view/hero_page_route.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static void show({required BuildContext context}) {
    // Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    //     builder: (context) => const Material(child: SearchPage._()),
    //     settings: const RouteSettings(name: 'searchPage'),
    //   ),
    // );

    Navigator.of(context).push(HeroPageRoute(
      tag: 'hero',
      child: const SearchPage._(),
    ));
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Shipment> _filteredData = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(shipments);
  }

  void _filterList() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredData = shipments;
      } else {
        String query = _searchController.text.toLowerCase();

        _filteredData = shipments
            .where((item) => item.receiptNumber.contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            _filterList();
          },
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                return _ItemCard(_filteredData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard(this.shipment);

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
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
          child: Row(
            children: [
              CircleAvatar(
                child: SvgPicture.asset(
                  'assets/svg/package.svg',
                  height: 25,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shipment.productName,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      '${shipment.receiptNumber} * ${shipment.origin}  ->  ${shipment.destination}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
