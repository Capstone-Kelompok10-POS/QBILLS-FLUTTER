import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: CustomPadding.kSidePadding,
          child: Text(
            'Report',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 22.0,
            ),
            Padding(
              padding: CustomPadding.kSidePadding,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Sort By',
                    isDense: true,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: ColorsCollection.GreyNeutral),
                    ),
                  ),
                  items: <String>[
                    'Hari ini',
                    '7 hari terakhir',
                    '30 hari terakhir',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Implementasi logika
                    print(newValue);
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: CustomPadding.kSidePadding,
              child: Column(
                children: [
                  Text(
                    'Histrory Transaction',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/pending.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Erin Stanton',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'Transfer Bank',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ Rp 50.000',
                  ),
                  Text(
                    'Pending',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/cancel.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cristofer Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'QRIS BCA',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp 50.000',
                  ),
                  Text(
                    'Cancel',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/cancel.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cristofer Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'QRIS - Shopee Pay',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp 50.000',
                  ),
                  Text(
                    'Cancel',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/succes.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jordyn Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'QRIS - Gopay',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ Rp 50.000',
                  ),
                  Text(
                    'Succes',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/succes.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jordyn Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'OVO',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ Rp 50.000',
                  ),
                  Text(
                    'Succes',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/succes.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jordyn Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'Cash',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ Rp 50.000',
                  ),
                  Text(
                    'Succes',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/succes.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jordyn Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'Cash',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ Rp 50.000',
                  ),
                  Text(
                    'Succes',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/succes.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jordyn Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'Cash',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ Rp 50.000',
                  ),
                  Text(
                    'Succes',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('images/cancel.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cristofer Donin',
                    style: AppTextStyles.titleProduct,
                  ),
                  Text(
                    '18 November 2023',
                    style: AppTextStyles.descriptionProduct,
                  ),
                  Text(
                    'Cash',
                    style: AppTextStyles.descriptionProduct,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp 50.000',
                  ),
                  Text(
                    'Cancel',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
