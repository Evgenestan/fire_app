import 'package:fire_app/auxiliary/colors.dart';
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

class SelectorView extends StatefulWidget {
  const SelectorView(this.items);
  final List<SelectorItem> items;

  @override
  _SelectorViewState createState() => _SelectorViewState();
}

class _SelectorViewState extends State<SelectorView> {
  List<SelectorItem> _filteredItems;
  TextEditingController _controller;

  void _searchCoefficient() {
    final text = _controller?.text;
    if (text != null) {
      setState(() {
        _filteredItems = widget.items.where((element) => element.title.contains(text)).toList();
      });
    }
  }

  Widget _buildSelectorItem(BuildContext context, int count) {
    final item = _filteredItems[count];
    return InkWell(
      splashColor: Colors.grey,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          item.title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
      onTap: () => Navigator.of(context).pop<dynamic>(item.value),
    );
  }

  Widget _separator(BuildContext context, int index) {
    return Container(
      height: 3,
      color: separatorColor,
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredItems ??= widget.items;
    _controller = TextEditingController();
    _controller.addListener(_searchCoefficient);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: MediaQuery.of(context).size.height * 0.66,
      child: Column(
        children: [
          BottomSheetHandle(controller: _controller),
          Expanded(
            child: ListView.separated(
              separatorBuilder: _separator,
              itemCount: _filteredItems.length,
              itemBuilder: _buildSelectorItem,
              physics: const BouncingScrollPhysics(),
              //padding: const EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}
