import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

import 'package:pos_capstone/models/product_model.dart';

import 'package:pos_capstone/view/detailproduct/productdetail.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late ProductProvider productProvider;
  // @override
  // void initState() {
  //   super.initState();
  //   productProvider = Provider.of(context, listen: false);
  // }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productProvider.getProducts();
    });
    return SingleChildScrollView(
        child: Consumer<ProductProvider>(builder: (context, provider, child) {
      if (provider.isLoading) {
        return const Center(
          child:
              CircularProgressIndicator(color: ColorsCollection.PrimaryColor),
        );
      } else {
        if (provider.isSearching && provider.filteredResults.isEmpty) {
          return const Center(
            child: Text("Data tidak ditemukan"),
          );
        } else if (!provider.isSearching &&
            provider.productModel?.results.isEmpty == true) {
          return Center(
            child: Text("Data tidak ditemukan",
                style: AppTextStyles.hintTextSearch),
          );
        }
        return Column(
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
                child: GridView.builder(
                    itemCount: provider.productModel!.results.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      mainAxisExtent: 278,
                    ),
                    itemBuilder: (_, index) {
                      Result productDetail =
                          provider.productModel!.results[index];

                      if (provider.isSearching) {
                        if (index < provider.filteredResults.length) {
                          productDetail = provider.filteredResults[index];
                        } else {
                          return Container();
                        }
                      } else {
                        if (index < provider.productModel!.results.length) {
                          productDetail = provider.productModel!.results[index];
                        } else {
                          return Container();
                        }
                      }
                      print(productDetail);
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
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(productDetail.image),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                productDetail.name,
                                style: AppTextStyles.titleProduct,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                productDetail.ingredients,
                                style: AppTextStyles.descriptionProduct,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Rp.${productDetail.productDetail[0].price.toString()}',
                                      style: AppTextStyles.titleProduct,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                    data: productDetail)),
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
            const SizedBox(height: 20),
          ],
        );
      }
    }));
  }
}
