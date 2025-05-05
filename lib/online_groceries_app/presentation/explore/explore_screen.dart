import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/online_groceries_app/presentation/provider/explore_provider.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
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
          searchTextFormFieldWidget(focusNode: searchFocusNode),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.01, right: 24.99),
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                  ),
                  itemCount: exploreDataFromProvider.length,
                  itemBuilder: (context, index) {
                    final exploreDataToShow = exploreDataFromProvider[index];
                    return exploreScreenWidget(
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
          ),
        ],
      ),
    );
  }
}
