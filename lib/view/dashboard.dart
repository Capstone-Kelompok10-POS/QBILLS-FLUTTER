import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/view/detailproduct/productdetail.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: CustomPadding.kSidePadding,
            child: Column(children: [
              Text(
                'Products',
                style: AppTextStyles.textProduct,
              )
            ]),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: CustomPadding.kSidePadding,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 278,
                  ),
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color:
                                    ColorsCollection.BlackNeutral.withOpacity(
                                        0.05),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 1))
                          ],
                          color: ColorsCollection.WhiteNeutral,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "images/cappucinoespreso.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Java Coffee",
                              style: AppTextStyles.titleProduct,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "coffee from espresso, steamed milk, & milk foam",
                              style: AppTextStyles.descriptionProduct,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Rp.26.000",
                                    style: AppTextStyles.titleProduct,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductDetail()),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: ColorsCollection.PrimaryColor),
                                    child: const Icon(
                                      Icons.chevron_right,
                                      color: ColorsCollection.WhiteNeutral,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
