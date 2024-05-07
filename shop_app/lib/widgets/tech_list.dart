import 'package:flutter/material.dart';
import 'package:shop_app/models/tech_item.dart';
import 'package:shop_app/widgets/new_item.dart';

class TechList extends StatefulWidget {
  const TechList({super.key});

  @override
  State<TechList> createState() => _TechListState();
}

class _TechListState extends State<TechList> {
  final List<TechItem> _techItems = [];
  // ignore unused field
  int? _removedItemIndex;

  void _addItem() async {
    final newItem = await Navigator.of(context).push<TechItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _techItems.add(newItem);
    });
  }

  void _removeItem(TechItem item) {
    final removedIndex = _techItems.indexOf(item);

    setState(() {
      _techItems.remove(item);
      _removedItemIndex = removedIndex;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item ${item.name} removed!"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _techItems.insert(removedIndex, item);
              _removedItemIndex = null;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        "No items yet :/",
        style: TextStyle(fontSize: 17.5),
      ),
    );

    if (_techItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _techItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_techItems[index].id),
          background: Container(
            color: const Color.fromARGB(199, 239, 83, 80),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            _removeItem(_techItems[index]);
          },
          child: ListTile(
            title: Text(_techItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _techItems[index].category.color,
            ),
            trailing: Text(_techItems[index].quantity.toString()),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Tech Store"),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
