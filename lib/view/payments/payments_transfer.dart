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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: Colors.white,
                    iconSize: 20,
                    splashRadius: 25,
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Open Sans',
                      height: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/transfer_payment.png',
                        height: 100,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Transfer Process',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Complete the payment according to the terms as soon as possible.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Container(
                        width: 320,
                        height: 70,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF9F9F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Please transfer to',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0.1,
                                    ),
                                  ),
                                  Image.asset('assets/bca.png'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            const SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'PT. Qbills.biz',
                                    style: TextStyle(
                                      color: Color(0xFF191919),
                                      fontSize: 16,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0.1,
                                    ),
                                  ),
                                  Text(
                                    '798 723 7797',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                      const SizedBox(height: 2),
                      const Divider(),
                      const SizedBox(height: 2),
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
                      const SizedBox(height: 2),
                      const Divider(),
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
                      // payment method
                      const SizedBox(height: 12),
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
                      const SizedBox(height: 5),
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
                      const SizedBox(height: 5),
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
                            'Rp 1.599',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // ini belum responsive, jadi bisa aja beda device beda ukuran, dan kurang rapi
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
                        child: const Text(
                          'Alredy Paid',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cancel payment',
                          style: TextStyle(
                            color: Color(0xFFDA2D2D),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Once your payment is confirmed, we will immediately send you a receipt.',
                style: TextStyle(
                  // color: Colors.black38,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
