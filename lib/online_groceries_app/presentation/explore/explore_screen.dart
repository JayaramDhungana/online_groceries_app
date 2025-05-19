import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/explore_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/search_provider.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/card_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/explore_screen_widget.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/widgets/search_text_form_field_widget.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  var searchFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(exploreProvider).loadExploreItems();
      ref.read(searchProvider).onQueryChanged("", context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exploreDataFromProvider = ref.watch(exploreProvider).exploreProducts;
    final searchResultItemFromProvider = ref.watch(searchProvider).searchResult;

    debugPrint("The result items is $searchResultItemFromProvider");

    bool isSearchResultAvailable =
        searchResultItemFromProvider.isEmpty ? false : true;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 18.h,
        centerTitle: true,
        title: Text(
          "Find Products",
          style: TextStyle(
            fontFamily: 'Gilory-Bold',
            fontWeight: FontWeight.w800,
            fontSize: 18.sp,
            letterSpacing: 0,
            height: (18 / 18).h,
          ),
        ),
      ),
      body: Column(
        children: [
          searchTextFormFieldWidget(
            context: context,
            padding: EdgeInsets.only(
              left: 24.71,
              right: 25.29,
              top: 20,
              bottom: 20,
            ),
            focusNode: searchFocusNode,
            ref: ref,
          ),
          Expanded(
            child: RPadding(
              padding: const EdgeInsets.only(left: 25.01, right: 27.54),
              child:
                  isSearchResultAvailable
                      ?
                      //if search result is available then search wala gridview.builder
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14.8.w,
                          mainAxisSpacing: 15.04.h,
                          mainAxisExtent: 248.51.h,
                        ),
                        itemCount: searchResultItemFromProvider.length,
                        itemBuilder: (context, index) {
                          debugPrint("The Coming index is $index");
                          final searchResultToShow =
                              searchResultItemFromProvider[index];
                          return cardWidget(
                            productImage: AssetImage(
                              searchResultToShow["imageUrl"],
                            ),
                            productName: searchResultToShow["productName"],
                            productPieces: searchResultToShow["productPieces"],
                            productPrice: searchResultToShow["productPrice"],
                            index: index,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailScreen(
                                      image: AssetImage(
                                        searchResultToShow["imageUrl"],
                                      ),
                                      productImageUrl:
                                          searchResultToShow["productName"],
                                      productName:
                                          searchResultToShow["productName"],
                                      index: index,
                                      productPrice:
                                          searchResultToShow["productPrice"],
                                      productPieces:
                                          searchResultToShow["productPieces"],
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      )
                      :
                      //This is only if search result is not available
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                        ),
                        itemCount: exploreDataFromProvider.length,
                        itemBuilder: (context, index) {
                          final exploreDataToShow =
                              exploreDataFromProvider[index];
                          return exploreScreenWidget(
                            ref: ref,
                            context: context,
                            splashColor: exploreDataToShow.borderColor,
                            boarderColor: exploreDataToShow.borderColor,
                            color: exploreDataToShow.color,
                            image: AssetImage(exploreDataToShow.imageUrl),
                            text: exploreDataToShow.name,
                          );
                        },
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
