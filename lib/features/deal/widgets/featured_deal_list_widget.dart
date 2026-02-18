// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/deal/controllers/featured_deal_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
// import 'package:flutter_sixvalley_ecommerce/features/home/widgets/aster_theme/find_what_you_need_shimmer.dart';
// import 'package:flutter_sixvalley_ecommerce/features/deal/widgets/featured_deal_card_widget.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';
//
//
// class FeaturedDealsListWidget extends StatelessWidget {
//   final bool isHomePage;
//   const FeaturedDealsListWidget({super.key, this.isHomePage = true});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return isHomePage?
//     Consumer<FeaturedDealController>(
//       builder: (context, featuredDealProvider, child) {
//         return featuredDealProvider.featuredDealProductList != null? featuredDealProvider.featuredDealProductList!.isNotEmpty ?
//         CarouselSlider.builder(
//           options: CarouselOptions(
//             aspectRatio: 2.5,
//             viewportFraction: 0.86,
//             autoPlay: true,
//             pauseAutoPlayOnTouch: true,
//             pauseAutoPlayOnManualNavigate: true,
//             pauseAutoPlayInFiniteScroll: true,
//             enlargeFactor: 0.2,
//             enlargeCenterPage: true,
//             enableInfiniteScroll: true,
//             disableCenter: true,
//             onPageChanged: (index, reason) => featuredDealProvider.changeSelectedIndex(index)
//           ),
//           itemCount: featuredDealProvider.featuredDealProductList?.length,
//           itemBuilder: (context, index, _) => FeaturedDealWidget(
//             isHomePage: isHomePage,
//             product: featuredDealProvider.featuredDealProductList![index],
//             isCenterElement: index == featuredDealProvider.featuredDealSelectedIndex,
//           ),
//         ) : const SizedBox() : const FindWhatYouNeedShimmer();
//       }):
//
//     Consumer<FeaturedDealController>(
//       builder: (context, featuredDealProvider, _) {
//         return RepaintBoundary(
//           child: MasonryGridView.count(
//             itemCount: featuredDealProvider.featuredDealProductList?.length,
//             crossAxisCount: ResponsiveHelper.isTab(context) ? 3 : 2,
//             padding: const EdgeInsets.all(0),
//             itemBuilder: (BuildContext context, int index) => ProductWidget(productModel: featuredDealProvider.featuredDealProductList![index]),
//           ),
//         );
//       }
//     );
//   }
// }
//
//



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/deal/controllers/featured_deal_controller.dart';
import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
import 'package:flutter_sixvalley_ecommerce/features/home/widgets/aster_theme/find_what_you_need_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/features/deal/widgets/featured_deal_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../common/basewidget/custom_image_widget.dart';
import '../../../helper/price_converter.dart';
import '../../../utill/custom_themes.dart';
import '../../product_details/widgets/favourite_button_widget.dart';


// class FeaturedDealsListWidget extends StatelessWidget {
//   final bool isHomePage;
//   const FeaturedDealsListWidget({super.key, this.isHomePage = true});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return isHomePage?
//     Consumer<FeaturedDealController>(
//         builder: (context, featuredDealProvider, child) {
//           return featuredDealProvider.featuredDealProductList != null? featuredDealProvider.featuredDealProductList!.isNotEmpty ?
//           // CarouselSlider.builder(
//           //   options: CarouselOptions(
//           //     // ✅ AspectRatio badal kar 0.8 kiya taaki vertical cards ki height sahi dikhe
//           //       aspectRatio: 0.8,
//           //       // ✅ ViewportFraction 0.5 kiya taaki ek screen par 2 cards dikhen
//           //       viewportFraction: 0.5,
//           //       autoPlay: true,
//           //       pauseAutoPlayOnTouch: true,
//           //       pauseAutoPlayOnManualNavigate: true,
//           //       pauseAutoPlayInFiniteScroll: true,
//           //       enlargeFactor: 0.2,
//           //       // ✅ Vertical design mein enlargeCenterPage false rakhna clean lagta hai
//           //       enlargeCenterPage: false,
//           //       enableInfiniteScroll: true,
//           //       disableCenter: true,
//           //       onPageChanged: (index, reason) => featuredDealProvider.changeSelectedIndex(index)
//           //   ),
//           //   itemCount: featuredDealProvider.featuredDealProductList?.length,
//           //   itemBuilder: (context, index, _) => FeaturedDealWidget(
//           //     isHomePage: isHomePage,
//           //     product: featuredDealProvider.featuredDealProductList![index],
//           //     isCenterElement: index == featuredDealProvider.featuredDealSelectedIndex,
//           //   ),
//           // )
//           CarouselSlider.builder(
//             options: CarouselOptions(
//               // ✅ Ise 0.8 se badha kar 1.2 kar diya taaki height kam ho jaye
//                 aspectRatio: 1.2,
//
//                 // ✅ Ise 0.5 hi rakhein taaki screen par 2 cards dikhte rahein
//                 viewportFraction: 0.52,
//
//                 autoPlay: true,
//                 pauseAutoPlayOnTouch: true,
//                 enlargeCenterPage: false,
//                 padEnds: false,
//                 disableCenter: true,
//                 onPageChanged: (index, reason) => featuredDealProvider.changeSelectedIndex(index)
//             ),
//             itemCount: featuredDealProvider.featuredDealProductList?.length,
//             // itemBuilder: (context, index, _) => FeaturedDealWidget(
//             //   isHomePage: isHomePage,
//             //   product: featuredDealProvider.featuredDealProductList![index],
//             //   isCenterElement: index == featuredDealProvider.featuredDealSelectedIndex,
//             // ),
//             itemBuilder: (context, index, _) => Padding(
//               // ✅ GAP FIX 4: Code 1 ki tarah exact 12px ka right gap
//               padding: const EdgeInsets.only(right: 8.0),
//               child: FeaturedDealWidget(
//                 isHomePage: isHomePage,
//                 product: featuredDealProvider.featuredDealProductList![index],
//                 isCenterElement: index == featuredDealProvider.featuredDealSelectedIndex,
//               ),
//             ),
//           )
//               : const SizedBox() : const FindWhatYouNeedShimmer();
//         }):
//
//     Consumer<FeaturedDealController>(
//         builder: (context, featuredDealProvider, _) {
//           return RepaintBoundary(
//             child: MasonryGridView.count(
//               itemCount: featuredDealProvider.featuredDealProductList?.length,
//               crossAxisCount: ResponsiveHelper.isTab(context) ? 3 : 2,
//               padding: const EdgeInsets.all(0),
//               itemBuilder: (BuildContext context, int index) => ProductWidget(productModel: featuredDealProvider.featuredDealProductList![index]),
//             ),
//           );
//         }
//     );
//   }
// }

class FeaturedDealsListWidget extends StatelessWidget {
  final bool isHomePage;
  const FeaturedDealsListWidget({super.key, this.isHomePage = true});

  @override
  Widget build(BuildContext context) {

    return isHomePage?
    Consumer<FeaturedDealController>(
        builder: (context, featuredDealProvider, child) {
          return featuredDealProvider.featuredDealProductList != null? featuredDealProvider.featuredDealProductList!.isNotEmpty ?
          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //
          //       aspectRatio: 1.4,
          //
          //
          //       viewportFraction: 0.50,
          //
          //       autoPlay: true,
          //       pauseAutoPlayOnTouch: true,
          //       enlargeCenterPage: false,
          //
          //
          //       padEnds: true,
          //
          //       disableCenter: true,
          //       onPageChanged: (index, reason) => featuredDealProvider.changeSelectedIndex(index)
          //   ),
          //   itemCount: featuredDealProvider.featuredDealProductList?.length,
          //   itemBuilder: (context, index, _) {
          //     final product = featuredDealProvider.featuredDealProductList![index];
          //
          //     return Padding(
          //
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       child: Container(
          //
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.zero,
          //           color: Theme.of(context).cardColor,
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //
          //
          //             Expanded(
          //               flex: 3,
          //               child: ClipRRect(
          //                 borderRadius: BorderRadius.zero,
          //                 child: CustomImageWidget(
          //                   image: '${product.thumbnailFullUrl?.path}',
          //                   fit: BoxFit.cover,
          //                   width: double.infinity,
          //                   height: double.infinity,
          //                 ),
          //               ),
          //             ),
          //
          //
          //             Expanded(
          //               flex: 1,
          //               child: Padding(
          //                 padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
          //                 child: Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Expanded(
          //                           child: Text(
          //                             PriceConverter.convertPrice(context, product.unitPrice,
          //                               discountType: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountType : product.discountType,
          //                               discount: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountAmount : product.discount,
          //                             ),
          //                             style: robotoBold.copyWith(
          //                               color: Colors.black,
          //                               fontSize: 16,
          //                             ),
          //                           ),
          //                         ),
          //
          //
          //                         SizedBox(
          //                           height: 28, width: 28,
          //                           child: FavouriteButtonWidget(
          //                             backgroundColor: Colors.transparent,
          //                             productId: product.id,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //
          //                     const SizedBox(height: 2),
          //
          //
          //                     Text(
          //                       product.name ?? '',
          //                       style: textRegular.copyWith(
          //                         fontSize: 12,
          //                         color: Colors.grey[600],
          //                       ),
          //                       maxLines: 1,
          //                       overflow: TextOverflow.ellipsis,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // )
          CarouselSlider.builder(
            options: CarouselOptions(

                aspectRatio: 1.4,


                viewportFraction: 0.48,

                autoPlay: true,
                enlargeCenterPage: false,

                padEnds: false,

                disableCenter: true,
                onPageChanged: (index, reason) => featuredDealProvider.changeSelectedIndex(index)
            ),
            itemCount: featuredDealProvider.featuredDealProductList?.length,
            itemBuilder: (context, index, _) {
              final product = featuredDealProvider.featuredDealProductList![index];

              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 12.0 : 0.0,
                  right: 12.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section (flex: 3)
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: CustomImageWidget(
                            image: '${product.thumbnailFullUrl?.path}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),

                      // Details Section (flex: 1)
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      PriceConverter.convertPrice(context, product.unitPrice,
                                        discountType: product.discountType,
                                        discount: product.discount,
                                      ),
                                      style: robotoBold.copyWith(color: Colors.black, fontSize: 15),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 24, width: 24,
                                    child: FavouriteButtonWidget(
                                      backgroundColor: Colors.transparent,
                                      productId: product.id,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                product.name ?? '',
                                style: textRegular.copyWith(fontSize: 12, color: Colors.grey[600]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )

              : const SizedBox() : const FindWhatYouNeedShimmer();
        }):

    Consumer<FeaturedDealController>(
        builder: (context, featuredDealProvider, _) {
          return RepaintBoundary(
            child: MasonryGridView.count(
              itemCount: featuredDealProvider.featuredDealProductList?.length,
              crossAxisCount: ResponsiveHelper.isTab(context) ? 3 : 2,
              padding: const EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) => ProductWidget(productModel: featuredDealProvider.featuredDealProductList![index]),
            ),
          );
        }
    );
  }
}