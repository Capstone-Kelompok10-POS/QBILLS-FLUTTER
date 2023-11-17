import 'package:flutter/material.dart';
import 'package:pos_capstone/view/chip/model.dart';

class ChoiceChipExample extends StatefulWidget {
  @override
  _ChoiceChipExampleState createState() => _ChoiceChipExampleState();
}

class _ChoiceChipExampleState extends State<ChoiceChipExample> {
  final listChoices = <ItemChoice>[
    ItemChoice(1, '7 Hari'),
    ItemChoice(2, '14 Hari'),
    ItemChoice(3, '1 Bulan'),
    ItemChoice(4, '3 Bulan'),
  ];
  var idSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choice Chip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terakhir ditambahkan'),
            Wrap(
              children: listChoices
                  .map((e) => ChoiceChip(
                        label: Text(e.label),
                        selected: idSelected == e.id,
                        onSelected: (_) => setState(() => idSelected = e.id),
                      ))
                  .toList(),
              spacing: 8,
            ),
          ],
        ),
      ),
    );
  }
}
