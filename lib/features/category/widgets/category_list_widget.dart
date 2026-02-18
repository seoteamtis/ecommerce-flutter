// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/title_row_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/category/controllers/category_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/features/category/widgets/category_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/localization/controllers/localization_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
//
// import 'category_shimmer_widget.dart';
//
// class CategoryListWidget extends StatelessWidget {
//   final bool isHomePage;
//   const CategoryListWidget({super.key, required this.isHomePage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CategoryController>(
//       builder: (context, categoryProvider, child) {
//         return Column(children: [
//
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraExtraSmall),
//             child: TitleRowWidget(
//               title: getTranslated('CATEGORY', context),
//               onTap: () {
//                 if(categoryProvider.categoryList.isNotEmpty) {
//                   RouterHelper.getCategoryScreenRoute(action: RouteAction.push);
//                 }
//               },
//             ),
//           ),
//           const SizedBox(height: Dimensions.paddingSizeSmall),
//
//           categoryProvider.categoryList.isNotEmpty ?
//           SizedBox( height: Provider.of<LocalizationController>(context, listen: false).isLtr ? MediaQuery.of(context).size.width/3.7 : MediaQuery.of(context).size.width/3,
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.horizontal,
//               itemCount: categoryProvider.categoryList.length > 10 ? 10 : categoryProvider.categoryList.length,
//
//               // shrinkWrap: true,
//
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell( splashColor: Colors.transparent, highlightColor: Colors.transparent,
//                     onTap: () {
//                       RouterHelper.getBrandCategoryRoute(
//                         action: RouteAction.push,
//                         isBrand: false,
//                         id: categoryProvider.categoryList[index].id,
//                         name: categoryProvider.categoryList[index].name,
//                       );
//                     },
//                     child: CategoryWidget(category: categoryProvider.categoryList[index],
//                         index: index,length:  categoryProvider.categoryList.length),
//                 );
//               },
//             ),
//           ) : const CategoryShimmerWidget(),
//         ]);
//
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/title_row_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/category/controllers/category_controller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart'; // Naya import
import 'package:provider/provider.dart';
import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
import 'category_shimmer_widget.dart';

class CategoryListWidget extends StatelessWidget {
  final bool isHomePage;
  const CategoryListWidget({super.key, required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryController>(
      builder: (context, categoryProvider, child) {
        return Column(children: [

          // (a) Title and View All (As per image_016217.png)
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          //   child: TitleRowWidget(
          //     title: getTranslated('CATEGORIES', context), // Capitalized like image
          //     onTap: () {
          //       if(categoryProvider.categoryList.isNotEmpty) {
          //         RouterHelper.getCategoryScreenRoute(action: RouteAction.push);
          //       }
          //     },
          //   ),
          // ),

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraExtraSmall),
            child: TitleRowWidget(
              title: getTranslated('CATEGORY', context),
              onTap: () {
                if(categoryProvider.categoryList.isNotEmpty) {
                  RouterHelper.getCategoryScreenRoute(action: RouteAction.push);
                }
              },
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),

          // (b) 4 Grid Images (As per image_016217.png)
          categoryProvider.categoryList.isNotEmpty ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2), // Very small gap for edge-to-edge look
            child: GridView.builder(
              shrinkWrap: true, // Grid ko column ke andar scrollable banane ke liye
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryProvider.categoryList.length > 4 ? 4 : categoryProvider.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                childAspectRatio: 0.8, // Rectangular look like ASOS/Zara
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    RouterHelper.getBrandCategoryRoute(
                      action: RouteAction.push,
                      isBrand: false,
                      id: categoryProvider.categoryList[index].id,
                      name: categoryProvider.categoryList[index].name,
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Full Background Image
                      CustomImageWidget(
                        image: '${categoryProvider.categoryList[index].imageFullUrl?.path}',
                        fit: BoxFit.cover,
                      ),

                      // Gradient Overlay for text readability
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                            stops: const [0.6, 1.0],
                          ),
                        ),
                      ),

                      // Category Name Text at Bottom Center
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Text(
                            categoryProvider.categoryList[index].name ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ) : const CategoryShimmerWidget(),
        ]);
      },
    );
  }
}