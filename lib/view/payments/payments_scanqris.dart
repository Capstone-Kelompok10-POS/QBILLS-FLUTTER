import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ScanQRPayment(),
  ));
}

class ScanQRPayment extends StatefulWidget {
  const ScanQRPayment({super.key});

  @override
  State<ScanQRPayment> createState() => _PaymentScanQRState();
}

class _PaymentScanQRState extends State<ScanQRPayment> {
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
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Scan QRIS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Complete the payment according to the terms as soon as possible.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            'Rp 28.600',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Image.asset(
                        'assets/qris_code.png',
                        height: 250,
                        isAntiAlias: true,
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Scan to Pay',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Can be used for all types of e-wallets',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF999999),
                        ),
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
