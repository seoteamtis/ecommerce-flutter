// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/no_internet_screen_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/brand/controllers/brand_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/features/category/controllers/category_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/features/search_product/widgets/partial_matched_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/search_product/widgets/search_product_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/splash/controllers/splash_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
// import 'package:flutter_sixvalley_ecommerce/features/search_product/controllers/search_product_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/theme/controllers/theme_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_app_bar_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_shimmer_widget.dart';
// import 'package:provider/provider.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   ScrollController scrollController = ScrollController();
//   @override
//   void initState() {
//     Provider.of<SearchProductController>(context, listen: false).cleanSearchProduct();
//     Provider.of<SearchProductController>(context, listen: false).initHistoryList();
//     Provider.of<SearchProductController>(context, listen: false).setInitialFilerData();
//
//     Provider.of<CategoryController>(context, listen: false).resetChecked(null, false);
//     Provider.of<SearchProductController>(context, listen: false).setFilterApply(isFiltered: false, isSorted: false, isUpdate: false);
//     Provider.of<CategoryController>(context, listen: false).selectedCategoryIds.clear();
//     Provider.of<BrandController>(context, listen: false).selectedBrandIds.clear();
//     Provider.of<SearchProductController>(context, listen: false).selectedSellerAuthorIds.clear();
//     Provider.of<SearchProductController>(context, listen: false).sellerPublishingHouseIds.clear();
//     Provider.of<SearchProductController>(context, listen: false).publishingHouseIds.clear();
//     Provider.of<SearchProductController>(context, listen: false).selectedAuthorIds.clear();
//     // Provider.of<SearchProductController>(context, listen: false).resetChecked(null, false);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: CustomAppBar(title: getTranslated('search_product', context)),
//       body: CustomScrollView(slivers: [
//           SliverToBoxAdapter(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
//               decoration: BoxDecoration(color: Theme.of(context).canvasColor,
//                   boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha:0.1), spreadRadius: 1, blurRadius: 3, offset: const Offset(0, 1),)]),
//               child: const SearchSuggestion()),
//
//             //const SizedBox(height: Dimensions.paddingSizeDefault),
//
//             Consumer<SearchProductController>(
//               builder: (context, searchProvider, child) {
//                 return (searchProvider.isLoading && searchProvider.searchedProduct == null) ?
//                 ProductShimmer(isHomePage: false, isEnabled : searchProvider.searchedProduct == null) :
//                 (searchProvider.searchedProduct != null && searchProvider.isClear) ?
//                 ((searchProvider.searchedProduct != null && searchProvider.searchedProduct?.products != null && searchProvider.searchedProduct!.products!.isNotEmpty) || (searchProvider.isSortingApplied || searchProvider.isFilterApplied)) ?
//                 const SearchProductWidget() : const NoInternetOrDataScreenWidget(isNoInternet: false) :
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     Consumer<SearchProductController>(
//                         builder: (context, searchProvider, child) {
//                           return Padding( padding: const EdgeInsets.symmetric(horizontal:  Dimensions.paddingSizeLarge),
//                             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                               if(searchProvider.historyList.isNotEmpty)
//                                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                                   Expanded(child: Text(getTranslated('search_history', context)!, style: textMedium.copyWith(fontSize : Dimensions.fontSizeLarge))),
//
//
//                                   InkWell(borderRadius: BorderRadius.circular(10),
//                                       onTap: () => Provider.of<SearchProductController>(context, listen: false).clearSearchAddress(),
//                                       child: Container(padding: const EdgeInsets.symmetric(horizontal:Dimensions.paddingSizeDefault,
//                                           vertical:Dimensions.paddingSizeLarge ),
//                                           child: Text(getTranslated('clear_all', context)!,
//                                               style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,
//                                                   color: Provider.of<ThemeController>(context).darkTheme? Colors.white : Theme.of(context).colorScheme.error))))]),
//
//
//
//                               Wrap(direction: Axis.horizontal, alignment : WrapAlignment.start,
//                                 children: [for (int index =0; index < searchProvider.historyList.length; index++)
//                                   Padding(padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//                                     child: Container(decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(50)),
//                                         color: Provider.of<ThemeController>(context, listen: false).darkTheme? Colors.grey.withValues(alpha:0.2): Theme.of(context).colorScheme.onPrimary.withValues(alpha:.1)),
//                                       padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall-3, horizontal: Dimensions.paddingSizeSmall),
//                                       margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
//                                       child: InkWell(onTap: () => searchProvider.searchProduct( query : searchProvider.historyList[index], offset: 1),
//                                         child: ConstrainedBox(
//                                           constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.85),
//                                           child: Row(mainAxisSize:MainAxisSize.min,children: [
//                                             Flexible(child: Text(searchProvider.historyList[index],
//                                                 style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
//                                                 overflow: TextOverflow.ellipsis)),
//                                             const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
//                                             InkWell(onTap: () {
//                                               //searchProvider.historyList.removeAt(index);
//                                               searchProvider.removeSearchAddress(index);
//                                               setState(() {});
//                                             },
//                                                 child: SizedBox(width: 20, child: Image.asset(Images.cancel, color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha:.5),)))])))))]),
//                              ],
//                             ),
//                           );
//                         }
//                     ),
//
//                   Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault,left: Dimensions.paddingSizeDefault,right: Dimensions.paddingSizeDefault),
//                     child: Text(getTranslated('popular_tag', context)!, style: textMedium.copyWith(fontSize : Dimensions.fontSizeLarge)),),
//
//
//                   Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//                     child: Consumer<SplashController>(
//                       builder: (context, popularTagProvider,_) {
//                         return Wrap(direction: Axis.horizontal, alignment : WrapAlignment.start,
//                           children: [for (int index = 0; index < popularTagProvider.configModel!.popularTags!.length; index++)
//                             Padding(padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//                               child: Container(decoration: BoxDecoration(
//                                   border: Border.all(width: .5, color: Theme.of(context).primaryColor.withValues(alpha:.125)),
//                                   borderRadius: const BorderRadius.all(Radius.circular(50))),
//                                 padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall-3, horizontal: Dimensions.paddingSizeSmall),
//                                 margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
//                                 child: InkWell(onTap: () => Provider.of<SearchProductController>(context, listen: false).searchProduct(query : popularTagProvider.configModel!.popularTags![index].tag??'', offset: 1),
//                                   child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.85),
//                                     child: Row(mainAxisSize:MainAxisSize.min,children: [
//                                       Flexible(child: Text(popularTagProvider.configModel!.popularTags![index].tag??'',
//                                           style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
//                                           overflow: TextOverflow.ellipsis))])))))]);})),
//                   ],
//                 );
//               },
//             ),
//           ],
//           ),)
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/category/controllers/category_controller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/features/search_product/controllers/search_product_controller.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
import 'package:provider/provider.dart';

import '../widgets/partial_matched_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // 4 Category Tabs: Women, Men, Kids, Sale
    _tabController = TabController(length: 4, vsync: this);

    // Initial data load
    Provider.of<SearchProductController>(context, listen: false).cleanSearchProduct();
    Provider.of<CategoryController>(context, listen: false).getCategoryList(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar null kiya kyunki search bar body ka part hai
      appBar: null,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Search Bar with Camera/Search Icon
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault,
                  vertical: Dimensions.paddingSizeSmall
              ),
              color: Theme.of(context).cardColor,
              child: const SearchSuggestion(),
            ),

            // 2. Main Categories Tabs
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                border: Border(bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black, // Dark indicator
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: textBold.copyWith(fontSize: Dimensions.fontSizeDefault),
                tabs: const [
                  Tab(text: 'WOMEN'),
                  Tab(text: 'MEN'),
                  Tab(text: 'KIDS'),
                  Tab(text: 'SALE'),
                ],
              ),
            ),

            // 3. L2 Category List View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildL2CategoryListView("Women"),
                  _buildL2CategoryListView("Men"),
                  _buildL2CategoryListView("Kids"),
                  _buildL2CategoryListView("Sale"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildL2CategoryListView(String filterName) {
  //   return Consumer<CategoryController>(
  //     builder: (context, categoryProvider, child) {
  //       return categoryProvider.categoryList.isNotEmpty
  //           ? ListView.builder(
  //         physics: const BouncingScrollPhysics(),
  //         padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
  //         itemCount: categoryProvider.categoryList.length,
  //         itemBuilder: (context, index) {
  //           var category = categoryProvider.categoryList[index];
  //
  //           return InkWell(
  //             onTap: () {
  //               // L2 navigation logic to products
  //               RouterHelper.getBrandCategoryRoute(
  //                 isBrand: false,
  //                 id: category.id,
  //                 name: category.name,
  //                 categoryModel: category,
  //               );
  //             },
  //             // Card Design: Text (Left) + Image (Right)
  //             child: Container(
  //               margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
  //               height: 110,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFFF2F2F2), // Grey background as per image
  //                 borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
  //               ),
  //               child: Row(
  //                 children: [
  //                   // Category Name (Left Side)
  //                   Expanded(
  //                     flex: 6,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 25),
  //                       child: Text(
  //                         category.name?.toUpperCase() ?? '',
  //                         style: textBold.copyWith(
  //                           fontSize: 18,
  //                           letterSpacing: 1.2,
  //                           color: Colors.black,
  //                         ),
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                   ),
  //
  //                   // Category Image (Right Side)
  //                   Expanded(
  //                     flex: 4,
  //                     child: ClipRRect(
  //                       borderRadius: const BorderRadius.only(
  //                         topRight: Radius.circular(Dimensions.paddingSizeExtraSmall),
  //                         bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall),
  //                       ),
  //                       child: CustomImageWidget(
  //                         image: '${category.imageFullUrl?.path}',
  //                         fit: BoxFit.cover,
  //                         height: 110,
  //                         width: double.infinity,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       )
  //           : const Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }
  Widget _buildL2CategoryListView(String filterName) {
    return Consumer<CategoryController>(
      builder: (context, categoryProvider, child) {

        // Agar data load ho raha hai
        if (categoryProvider.categoryList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // 1. Aapki batayi hui categories ki list
        List<String> itemsToShow = [];
        if (filterName == "Women") {
          itemsToShow = ["LAGGY"];
        } else if (filterName == "Men") {
          itemsToShow = ["Hoodie", "Outerwear", "Shorts", "Sweater", "Sleeveless shirt", "Chambray", "Chinos", "Flannel shirt", "Jeans", "T-Shirt", "Shirt", "Trousers"];
        }

        // Agar Kids ya Sale hai toh khali dikhao
        if (itemsToShow.isEmpty) return const SizedBox();

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          itemCount: itemsToShow.length,
          itemBuilder: (context, index) {
            // 2. Hum original category list ka pehla item (ya index wise) le rahe hain
            // taaki uska 'Model' aur 'ID' use kar sakein navigation ke liye
            var originalCategory = categoryProvider.categoryList[index % categoryProvider.categoryList.length];

            return InkWell(
              onTap: () {
                // ✅ YE CLICK WAHI HAI JO AAPNE MANGA THA
                // Hum naam apna (itemToShow) bhej rahe hain lekin ID backend ki use kar rahe hain
                RouterHelper.getBrandCategoryRoute(
                  isBrand: false,
                  id: originalCategory.id,
                  name: itemsToShow[index],
                  categoryModel: originalCategory,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                ),
                child: Row(
                  children: [
                    // Expanded(
                    //   flex: 6,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 25),
                    //     child: Text(
                    //       itemsToShow[index].toUpperCase(), // Aapka bataya hua naam
                    //       style: textBold.copyWith(fontSize: 18, letterSpacing: 1.2, color: Colors.black),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          itemsToShow[index].toUpperCase(),
                          style: textBold.copyWith(
                            // ✅ 18 ki jagah Dimensions.fontSizeDefault (14) ya fontSizeLarge (16) use karein
                            fontSize: Dimensions.fontSizeDefault,
                            letterSpacing: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(Dimensions.paddingSizeExtraSmall),
                          bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall),
                        ),
                        child: CustomImageWidget(
                          image: '${originalCategory.imageFullUrl?.path}',
                          fit: BoxFit.cover,
                          height: 110,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}