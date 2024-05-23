import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nic_test/home/app_data/appata.dart';
import 'package:nic_test/model/items.dart';
import 'package:provider/provider.dart';

class AddItems extends StatefulWidget {
  const AddItems({
    super.key,
  });

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _describtionEditingController =
      TextEditingController();

  void addItems() {
    Item item = Item();
    item.name = _textEditingController.text.toString();
    item.describtion = _describtionEditingController.text.toString();

    Provider.of<AppData>(context, listen: false).updateItems(item);
    print(item.name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Items'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Item Name'),
              ),
              const Gap(8),
              TextFormField(
                controller: _describtionEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Describtion'),
              ),
              const Gap(20),
              ElevatedButton(
                  onPressed: () {
                    if (_textEditingController.text.toString().isNotEmpty &&
                        _describtionEditingController.text
                            .toString()
                            .isNotEmpty) {
                      addItems();
                    }
                  },
                  child: Text('Add Items'))
            ],
          ),
        ),
      ),
    );
  }
}
