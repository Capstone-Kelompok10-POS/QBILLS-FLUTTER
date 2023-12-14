import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class ReportScreen extends StatelessWidget {
  final List<String> transactionLogs = [
    "Transaksi berhasil: Pembelian Coffe Cappucino 1x Success Payment Rp 50.000  \nStatus: Success \nTanggal: 2023-12-15  \nPukul : 00:00:00 \nTransaksi ID: 1234567890 \nMember ID: 1234567890 \nNama Member: Ade Fery Angriawan",
    "Transaksi gagal: Pemesanan Coffe Cappucino 1x Failed Payment \nStatus: Failed \nTanggal: 2023-12-15  \nPukul : 00:00:00 \nTransaksi ID: 1234567890 \nMember ID: 1234567890 \nNama Member: Ade Fery Angriawan",
    "Transaksi berhasil: Pemesanan Coffe Cappucino 1x Failed Payment \nStatus: Failed \nTanggal: 2023-12-15  \nPukul : 00:00:00 \nTransaksi ID: 1234567890 \nMember ID: 1234567890 \nNama Member: Ade Fery Angriawan",
    "Transaksi Pending : Pemesanan Coffe Cappucino 1x Success Payment \nStatus: Pending \nTanggal: 2023-12-15  \nPukul : 00:00:00 \nTransaksi ID: 1234567890 \nMember ID: 1234567890 \nNama Member: Ade Fery Angriawan",
    "Transaksi Cancel : Pemesanan Coffe Cappucino 1x Success Payment \nStatus: Cancel \nTanggal: 2023-12-15  \nPukul : 00:00:00 \nTransaksi ID: 1234567890 \nMember ID: 1234567890 \nNama Member: Ade Fery Angriawan",
    "Transaksi Cancel : Pemesanan Coffe Cappucino 1x Success Payment \nStatus: Cancel \nTanggal: 2023-12-15  \nPukul : 00:00:00 \nTransaksi ID: 1234567890 \nMember ID: 1234567890 \nNama Member: Ade Fery Angriawan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      appBar: AppBar(
        title: Text('Report Transaksi', style: AppTextStyles.appbartitlewhite),
        backgroundColor: ColorsCollection.PrimaryColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: transactionLogs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      transactionLogs[index],
                      style: AppTextStyles.messageChatbotBlack,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: ColorsCollection.PrimaryColor,
          minimumSize: Size(double.infinity, 60),
        ),
        onPressed: () {
          print("Generate Report Again button pressed");
        },
        child: Text(
          "Generate Report Again",
          style: AppTextStyles.bottomButton,
        ),
      ),
    );
  }
}
