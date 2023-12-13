import 'package:flutter/material.dart';
import 'package:pos_capstone/viewmodel/view_model_membership.dart';
import 'package:provider/provider.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:pos_capstone/view/membership/membership_add.dart';
import 'package:pos_capstone/view/membership/membership_details.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/padding/padding_collection.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class MembershipListPage extends StatefulWidget {
  const MembershipListPage({Key? key}) : super(key: key);

  @override
  State<MembershipListPage> createState() => _MembershipListPageState();
}

class _MembershipListPageState extends State<MembershipListPage> {
  late MembershipProvider membershipProvider;

  @override
  Widget build(BuildContext context) {
    membershipProvider =
        Provider.of<MembershipProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      membershipProvider.getMembers();
    });
    return Scaffold(
      backgroundColor: ColorsCollection.WhiteNeutral,
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: ColorsCollection.WhiteNeutral,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: CustomPadding.kSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Membership List", style: AppTextStyles.appbartitle),
              const SizedBox(height: 20),
              TextField(
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    // Panggil metode pencarian di ViewModel
                    Provider.of<MembershipProvider>(context, listen: false)
                        .searchMembers(
                            query, membershipProvider.membershipModel!.results);
                  } else {
                    Provider.of<MembershipProvider>(context, listen: false)
                        .clearSearch();
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppTextStyles.hintTextSearch,
                  isDense: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ColorsCollection.GreyNeutral),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ColorsCollection.GreyNeutral),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: ColorsCollection.GreyNeutral,
                  ),
                ),
                style: AppTextStyles.hintTextSearch,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: CustomPadding.kSidePadding,
        child: Consumer<MembershipProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorsCollection.PrimaryColor,
              ));
            } else {
              return ListView.builder(
                itemCount: provider.membershipModel!.results.length,
                itemBuilder: (_, index) {
                  Result result;
                  if (provider.isSearching) {
                    if (index < provider.filteredResults.length) {
                      result = provider.filteredResults[index];
                    } else {
                      // Handle case when index is out of range
                      // (You can return an empty widget or handle it based on your use case)
                      return Container();
                    }
                  } else {
                    if (index < provider.membershipModel!.results.length) {
                      result = provider.membershipModel!.results[index];
                    } else {
                      // Handle case when index is out of range
                      // (You can return an empty widget or handle it based on your use case)
                      return Container();
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 3,
                      shadowColor:
                          ColorsCollection.GreyNeutral02.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: AssetImage('images/kopi1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(result.name,
                                    style: AppTextStyles.titleStyleBlack),
                                Text(result.phoneNumber,
                                    style: AppTextStyles.subtitleStyle),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.navigate_next),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MemberDetailsPage(
                                      name: result.name,
                                      totalPoint: result.totalPoint,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MembershipScreen()),
          );
        },
        backgroundColor: const Color(0xFFBE8465),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
