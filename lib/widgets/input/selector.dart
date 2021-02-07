import 'package:fire_app/widgets/bottom_sheet_handle.dart';
import 'package:flutter/material.dart';

class SelectorItem<T> {
  SelectorItem({@required this.title, @required this.value});
  final String title;
  final T value;
}

Future<T> showSelector<T>({@required List<SelectorItem<T>> items, @required BuildContext context}) async {
  return await showModalBottomSheet<T>(context: context, builder: (_) => SelectorView(items), isScrollControlled: true, backgroundColor: Colors.transparent);
}

class SelectorView extends StatelessWidget {
  const SelectorView(this.items);
  final List<SelectorItem> items;

  Widget _buildSelectorList(BuildContext context, int count) {
    final item = items[count];
    return InkWell(
      child: SizedBox(
        height: 30,
        child: Text(item.title),
      ),
      onTap: () => Navigator.of(context).pop<dynamic>(item.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    //items.insert(0, SelectorItem<String>(title: '', value: null));
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 300,
      child: Column(
        children: [
          BottomSheetHandle(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: _buildSelectorList,
            ),
          ),
        ],
      ),
    );
  }
}
