import 'package:flutter/material.dart';
import 'package:shipments/common/extensions.dart';
import 'package:shipments/view/result_page.dart';

enum ItemType {
  documents,
  glass,
  liquid,
  food,
  electronic,
  product,
  others,
}

class CalculationPage extends StatefulWidget {
  const CalculationPage._();

  static void show({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const Material(child: CalculationPage._()),
        settings: const RouteSettings(name: 'calculationPage'),
      ),
    );
  }

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  ItemType? _selectedItemType;

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Destination',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          fillColor: Colors.grey[100],
                          hintText: "Sender location",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_upward, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          hintText: "Receiver location",
                          fillColor: Colors.grey[100],
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          hintText: "Approx weight",
                          fillColor: Colors.grey[100],
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.scale,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Packaging',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'What are you sending? ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                ),
                hint: const Text('Select your item type'),
                value: dropdownValue,
                onChanged: (String? newValue) {},
                items: <String>['BOX', 'CASE', 'PALLET']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'What are you sending? ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Wrap(
                children: ItemType.values
                    .map((e) => _ItemTypeSelection(
                          itemtype: e,
                          onPressed: () {
                            setState(() {
                              _selectedItemType = e;
                            });
                          },
                          selectedItemType: _selectedItemType,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ResultPage.show(context: context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemTypeSelection extends StatelessWidget {
  const _ItemTypeSelection(
      {required this.itemtype,
      required this.onPressed,
      required this.selectedItemType});

  final ItemType itemtype;
  final ItemType? selectedItemType;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ActionChip(
        avatar: itemtype == selectedItemType
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
        backgroundColor:
            itemtype == selectedItemType ? Colors.deepPurple : null,
        labelStyle: TextStyle(
          color: itemtype == selectedItemType ? Colors.white : null,
        ),
        onPressed: onPressed,
        label: Text(itemtype.name.capitalized),
      ),
    );
  }
}
