import 'package:fire_app/widgets/buttons.dart';
import 'package:fire_app/widgets/input/text_input.dart';
import 'package:fire_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({Key key, this.title = '', this.label = ''}) : super(key: key);

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    String result = '';
    void _saveEntry() {
      if (result.isNotEmpty) {
        Navigator.of(context).pop(result);
      }
    }

    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      titlePadding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            HeadingM(title, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            TextInput(
              label: label,
              onChanged: (text) => result = text,
            ),

            //const SizedBox(height: 5),
            // Button(
            //   onPressed: _saveEntry,
            //   title: 'Сохранить',
            //   color: Colors.grey,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Button(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.clear, size: 30),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Button(
                    child: const Icon(Icons.save, size: 30),
                    onPressed: _saveEntry,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        )
      ],
    );
  }
}
