import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TransferPayment(),
  ));
}

class TransferPayment extends StatefulWidget {
  const TransferPayment({super.key});

  @override
  State<TransferPayment> createState() => _PaymentsState();
}

class _PaymentsState extends State<TransferPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.89,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 14),
                      Image.asset(
                        'assets/logo.png',
                        height: 100,
                      ),
                      const Divider(),
                      const SizedBox(height: 14),
                      // invoice
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Invoice',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'FRMPY127632765717',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      // cashier
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cashier',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Victor Yoga',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // deliver to
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Deliver to',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Erin Stanto',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // date
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '27 Oktober 2023',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Normal',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 10,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Cappucino Espresso',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF4C4C4C),
                            fontSize: 13,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // jumlah dan harga
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1 x 26.000',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '26.000',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // note
                      const SizedBox(height: 8),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Note',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF191919),
                            fontSize: 10,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      // main note
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Erin Stanto is our member, his coffee wants a little sugar with added cream',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      // payment method
                      const SizedBox(height: 14),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Transfer',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // Discount
                      const SizedBox(height: 3),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Rp 0',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // Tax / pajak
                      const SizedBox(height: 3),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TAX',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Rp 2.600',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // remaining points
                      const SizedBox(height: 15),
                      const SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Remaining points',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 12,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '2400',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 12,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // total payment
                      const SizedBox(height: 3),
                      const Divider(),
                      const SizedBox(height: 3),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF191919),
                            ),
                          ),
                          Text(
                            'Rp 28.600',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // ini belum responsive, jadi bisa aja beda device beda ukuran, dan kurang rapi
                      // download receipt
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color(0xFFBE8465).withOpacity(1.0),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_download_outlined),
                            SizedBox(width: 10),
                            Text(
                              'Print Receipt',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Need help?',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFFFAF6F4),
                    fontSize: 10,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
