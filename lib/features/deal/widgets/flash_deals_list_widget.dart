// import 'dart:io';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/deal/controllers/flash_deal_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/slider_product_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/home/shimmers/flash_deal_shimmer.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';
//
//
// class FlashDealsListWidget extends StatelessWidget {
//   final bool isHomeScreen;
//   const FlashDealsListWidget({super.key, this.isHomeScreen = true});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = ResponsiveHelper.isTab(context);
//
//     // Aspect ratio of your product card (width / height)
//     final cardAspectRatio = 200 / (Platform.isIOS ? 260 : 270);
//
//     // Decide how much width one card should take (fraction of screen)
//     final viewportFraction = isTablet ? 0.4 : 0.6;
//     final cardWidth = screenWidth * viewportFraction;
//     final cardHeight = cardWidth / cardAspectRatio;
//
//
//     return isHomeScreen ? Consumer<FlashDealController>(
//         builder: (context, flashDealController, child) {
//           return flashDealController.flashDeal != null ? flashDealController.flashDealList.isNotEmpty ?
//           SizedBox(
//             height: cardHeight,
//             child: CarouselSlider.builder(
//               options: CarouselOptions(
//                 viewportFraction: viewportFraction,
//                 autoPlay: true,
//                 pauseAutoPlayOnTouch: true,
//                 pauseAutoPlayOnManualNavigate: true,
//                 enlargeFactor: 0.2,
//                 enlargeCenterPage: true,
//                 pauseAutoPlayInFiniteScroll: true,
//                 disableCenter: true,
//                 onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
//               ),
//               itemCount: flashDealController.flashDealList.isEmpty ? 1 : flashDealController.flashDealList.length,
//               itemBuilder: (context, index, next) {
//                 return SliderProductWidget(product: flashDealController.flashDealList[index], isCurrentIndex: index == flashDealController.currentIndex);
//               },
//             ),
//           ) : const SizedBox() : const FlashDealShimmer();
//         }) : Consumer<FlashDealController>(
//       builder: (context, flashDealController, child) {
//         return flashDealController.flashDealList.isNotEmpty ?
//         RepaintBoundary(
//           child: MasonryGridView.count(
//             itemCount: flashDealController.flashDealList.length,
//             padding: const EdgeInsets.all(0),
//             itemBuilder: (BuildContext context, int index) {
//               return ProductWidget(productModel: flashDealController.flashDealList[index]);
//             }, crossAxisCount: 2,
//           ),
//         ) : const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
//
//
//



import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/deal/controllers/flash_deal_controller.dart';
import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/slider_product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/home/shimmers/flash_deal_shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../common/basewidget/custom_image_widget.dart';
import '../../../helper/price_converter.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/dimensions.dart';
import '../../product_details/widgets/favourite_button_widget.dart';

// class FlashDealsListWidget extends StatelessWidget {
//   final bool isHomeScreen;
//   const FlashDealsListWidget({super.key, this.isHomeScreen = true});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = ResponsiveHelper.isTab(context);
//     final cardAspectRatio = 200 / (Platform.isIOS ? 260 : 270);
//     // final viewportFraction = isTablet ? 0.4 : 0.6;
//     final viewportFraction = isTablet ? 0.35 : 0.52;
//     final cardWidth = screenWidth * viewportFraction;
//     final cardHeight = cardWidth / cardAspectRatio;
//
//     return isHomeScreen ? Consumer<FlashDealController>(
//         builder: (context, flashDealController, child) {
//           return flashDealController.flashDeal != null ? flashDealController.flashDealList.isNotEmpty ?
//           SizedBox(
//             height: cardHeight,
//             child: CarouselSlider.builder(
//               // options: CarouselOptions(
//               //   viewportFraction: viewportFraction,
//               //   autoPlay: true,
//               //   pauseAutoPlayOnTouch: true,
//               //   pauseAutoPlayOnManualNavigate: true,
//               //
//               //   enlargeFactor: 0.0,
//               //   enlargeCenterPage: false,
//               //   pauseAutoPlayInFiniteScroll: true,
//               //   disableCenter: true,
//               //   onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
//               // ),
//               options: CarouselOptions(
//                 viewportFraction: viewportFraction,
//                 autoPlay: true,
//                 enlargeCenterPage: false,
//                 padEnds: false,
//                 disableCenter: true,
//                 onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
//               ),
//               itemCount: flashDealController.flashDealList.isEmpty ? 1 : flashDealController.flashDealList.length,
//               // itemBuilder: (context, index, next) {
//               //   return SliderProductWidget(
//               //       product: flashDealController.flashDealList[index],
//               //       isCurrentIndex: index == flashDealController.currentIndex
//               //   );
//               // },
//               itemBuilder: (context, index, next) {
//                 return Padding(
//
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: SliderProductWidget(
//                       product: flashDealController.flashDealList[index],
//                       isCurrentIndex: index == flashDealController.currentIndex
//                   ),
//                 );
//               },
//             ),
//           ) : const SizedBox() : const FlashDealShimmer();
//         }) : Consumer<FlashDealController>(
//       builder: (context, flashDealController, child) {
//         return flashDealController.flashDealList.isNotEmpty ?
//         RepaintBoundary(
//           child: MasonryGridView.count(
//             itemCount: flashDealController.flashDealList.length,
//             padding: const EdgeInsets.all(0),
//             itemBuilder: (BuildContext context, int index) {
//               return ProductWidget(productModel: flashDealController.flashDealList[index]);
//             }, crossAxisCount: 2,
//           ),
//         ) : const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

class FlashDealsListWidget extends StatelessWidget {
  final bool isHomeScreen;
  const FlashDealsListWidget({super.key, this.isHomeScreen = true});

  @override
  Widget build(BuildContext context) {
    const viewportFraction = 0.50;

    return isHomeScreen ? Consumer<FlashDealController>(
        builder: (context, flashDealController, child) {
          return flashDealController.flashDeal != null ? flashDealController.flashDealList.isNotEmpty ?
          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //
          //     aspectRatio: 1.4,
          //     viewportFraction: viewportFraction,
          //     autoPlay: true,
          //     enlargeCenterPage: false,
          //
          //     padEnds: true,
          //     disableCenter: true,
          //     onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
          //   ),
          //   itemCount: flashDealController.flashDealList.length,
          //   itemBuilder: (context, index, next) {
          //     final product = flashDealController.flashDealList[index];
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
          //                               fontSize: 15,
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
          //                     // Product Name
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

          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //     aspectRatio: 1.4,
          //     viewportFraction: 0.48,
          //
          //     autoPlay: true,
          //     enlargeCenterPage: false,
          //
          //     padEnds: false,
          //
          //     disableCenter: true,
          //     onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
          //   ),
          //   itemCount: flashDealController.flashDealList.length,
          //   itemBuilder: (context, index, next) {
          //     final product = flashDealController.flashDealList[index];
          //
          //     return Padding(
          //       padding: EdgeInsets.only(
          //         left: index == 0 ? 16.0 : 0.0,
          //         right: 12.0,
          //       ),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.zero,
          //           color: Theme.of(context).cardColor,
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
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
          //                             style: robotoBold.copyWith(color: Colors.black, fontSize: 15),
          //                           ),
          //                         ),
          //                         // Heart Icon
          //                         SizedBox(
          //                           height: 28, width: 28,
          //                           child: FavouriteButtonWidget(
          //                             backgroundColor: Colors.transparent,
          //                             productId: product.id,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     const SizedBox(height: 2),
          //                     Text(
          //                       product.name ?? '',
          //                       style: textRegular.copyWith(fontSize: 12, color: Colors.grey[600]),
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

          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //
          //     aspectRatio: 1.5,
          //
          //
          //     viewportFraction: 0.47,
          //
          //     autoPlay: true,
          //     enlargeCenterPage: false,
          //     padEnds: false,
          //     disableCenter: true,
          //     onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
          //   ),
          //   itemCount: flashDealController.flashDealList.length,
          //   itemBuilder: (context, index, next) {
          //     final product = flashDealController.flashDealList[index];
          //
          //     return Padding(
          //
          //
          //       padding: EdgeInsets.only(
          //         left: index == 0 ? 16.0 : 8.0,
          //         right: 8.0,
          //       ),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.zero,
          //           color: Theme.of(context).cardColor,
          //
          //           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3)],
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
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
          //             Expanded(
          //               flex: 1,
          //               child: Padding(
          //                 padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
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
          //                             style: robotoBold.copyWith(color: Colors.black, fontSize: 14),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 24, width: 24,
          //                           child: FavouriteButtonWidget(
          //                             backgroundColor: Colors.transparent,
          //                             productId: product.id,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     const SizedBox(height: 2),
          //                     Text(
          //                       product.name ?? '',
          //                       style: textRegular.copyWith(fontSize: 11, color: Colors.grey[600]),
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

              viewportFraction: 0.45,

              autoPlay: true,
              enlargeCenterPage: false,
              padEnds: false,
              disableCenter: true,
              onPageChanged: (index, reason) => flashDealController.setCurrentIndex(index),
            ),
            itemCount: flashDealController.flashDealList.length,
            itemBuilder: (context, index, next) {
              final product = flashDealController.flashDealList[index];

              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? Dimensions.paddingSizeDefault : 16.0,
                  right: 0.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section
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

                      // Details Section
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
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
                                        discountType: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountType : product.discountType,
                                        discount: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountAmount : product.discount,
                                      ),
                                      style: robotoBold.copyWith(
                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: FavouriteButtonWidget(
                                      backgroundColor: Colors.transparent,
                                      productId: product.id,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.name ?? '',
                                style: textRegular.copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                ),
                                maxLines: 2,
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
              : const SizedBox() : const FlashDealShimmer();

        }) : Consumer<FlashDealController>(
      builder: (context, flashDealController, child) {
        return flashDealController.flashDealList.isNotEmpty ?
        RepaintBoundary(
          child: MasonryGridView.count(
            itemCount: flashDealController.flashDealList.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(productModel: flashDealController.flashDealList[index]);
            }, crossAxisCount: 2,
          ),
        ) : const Center(child: CircularProgressIndicator());
      },
    );
  }
}