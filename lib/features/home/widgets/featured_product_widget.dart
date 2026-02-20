import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/slider_product_shimmer_widget.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/title_row_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/controllers/product_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/domain/models/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/enums/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../common/basewidget/custom_image_widget.dart';
import '../../../helper/price_converter.dart';
import '../../../utill/custom_themes.dart';
import '../../product_details/widgets/favourite_button_widget.dart';

// class FeaturedProductWidget extends StatelessWidget {
//   const FeaturedProductWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = ResponsiveHelper.isTab(context);
//
//     final viewportFraction = isTablet ? 0.4 : 0.6;
//
//     return Selector<ProductController, ProductModel?>(
//       selector: (ctx, productController)=> productController.featuredProductModel,
//         builder: (context, featuredProductModel, _) {
//       return (featuredProductModel?.products?.isNotEmpty ?? false)  ? ColoredBox(
//         color: Theme.of(context).colorScheme.onTertiary,
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 0,
//               vertical: Dimensions.paddingSizeExtraSmall,
//             ),
//             child: TitleRowWidget(
//               title: getTranslated('featured_products', context),
//               onTap: () => RouterHelper.getViewAllProductScreenRoute(productType: ProductType.featuredProduct, action: RouteAction.push),
//             ),
//           ),
//
//           SizedBox(
//             height: ResponsiveHelper.isTab(context)? MediaQuery.of(context).size.width * .58 : 295,
//             child: CarouselSlider.builder(
//               options: CarouselOptions(
//                 viewportFraction: viewportFraction,
//                 // autoPlay: true,
//                 pauseAutoPlayOnTouch: true,
//                 pauseAutoPlayOnManualNavigate: true,
//                 enlargeFactor: 0.3,
//                 enlargeCenterPage: true,
//                 pauseAutoPlayInFiniteScroll: true,
//                 disableCenter: true,
//               ),
//               itemCount: featuredProductModel?.products?.length ?? 0,
//               itemBuilder: (context, index, next) {
//                 return ProductWidget(productModel: featuredProductModel!.products![index], productNameLine: 1, margin: 0,);
//               },
//             ),
//           ),
//
//           SizedBox(height: Dimensions.paddingSizeExtraSmall)
//         ]),
//       ) : featuredProductModel == null ? const SliderProductShimmerWidget() : const SizedBox();
//     });
//   }
// }


// class FeaturedProductWidget extends StatelessWidget {
//   const FeaturedProductWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final isTablet = ResponsiveHelper.isTab(context);
//     final viewportFraction = isTablet ? 0.35 : 0.52;
//
//     return Selector<ProductController, ProductModel?>(
//         selector: (ctx, productController)=> productController.featuredProductModel,
//         builder: (context, featuredProductModel, _) {
//           return (featuredProductModel?.products?.isNotEmpty ?? false)  ? ColoredBox(
//             color: Theme.of(context).colorScheme.onTertiary,
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 0,
//                   vertical: Dimensions.paddingSizeExtraSmall,
//                 ),
//                 child: TitleRowWidget(
//                   title: getTranslated('featured_products', context),
//                   onTap: () => RouterHelper.getViewAllProductScreenRoute(productType: ProductType.featuredProduct, action: RouteAction.push),
//                 ),
//               ),
//
//               SizedBox(
//                 height: ResponsiveHelper.isTab(context)? MediaQuery.of(context).size.width * .58 : 285,
//                 child: CarouselSlider.builder(
//                   options: CarouselOptions(
//                     viewportFraction: viewportFraction,
//                     enlargeCenterPage: false, // ✅ Cards ek hi line mein rahenge
//                     padEnds: false, // ✅ Pehla card left se shuru hoga
//                     autoPlay: true,
//                     pauseAutoPlayOnTouch: true,
//                     pauseAutoPlayOnManualNavigate: true,
//                     enlargeFactor: 0.0,
//                     disableCenter: true,
//                   ),
//                   itemCount: featuredProductModel?.products?.length ?? 0,
//                   itemBuilder: (context, index, next) {
//                     // Code 1 ki details nikaalte hain
//                     final product = featuredProductModel!.products![index];
//
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0), // ✅ Cards ke beech ka perfect gap
//                       child: Container(
//                         // ✅ Code 1 wala design: Sharp corners aur card color
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.zero,
//                           color: Theme.of(context).cardColor,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             // ✅ Image Section (Code 1 Style)
//                             Expanded(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.zero,
//                                 child: CustomImageWidget(
//                                   image: '${product.thumbnailFullUrl?.path}',
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               ),
//                             ),
//
//                             // ✅ Details Section (Code 1 Padding aur Logic)
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           PriceConverter.convertPrice(context, product.unitPrice,
//                                             discountType: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountType : product.discountType,
//                                             discount: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountAmount : product.discount,
//                                           ),
//                                           style: robotoBold.copyWith(
//                                             color: Colors.black, // ✅ Premium dark price
//                                             fontSize: 15,
//                                           ),
//                                         ),
//                                       ),
//
//                                       // Heart Icon
//                                       SizedBox(
//                                         height: 28, width: 28,
//                                         child: FavouriteButtonWidget(
//                                           backgroundColor: Colors.transparent,
//                                           productId: product.id,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   const SizedBox(height: 2),
//
//                                   // Product Name
//                                   Text(
//                                     product.name ?? '',
//                                     style: textRegular.copyWith(
//                                       fontSize: 12,
//                                       color: Colors.grey[600],
//                                     ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: Dimensions.paddingSizeExtraSmall)
//             ]),
//           ) : featuredProductModel == null ? const SliderProductShimmerWidget() : const SizedBox();
//         });
//   }
// }


class FeaturedProductWidget extends StatelessWidget {
  const FeaturedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveHelper.isTab(context);
    final viewportFraction = isTablet ? 0.35 : 0.50;

    return Selector<ProductController, ProductModel?>(
        selector: (ctx, productController)=> productController.featuredProductModel,
        builder: (context, featuredProductModel, _) {
          return (featuredProductModel?.products?.isNotEmpty ?? false)  ? ColoredBox(
            // color: Theme.of(context).colorScheme.onTertiary,
            color: Theme.of(context).cardColor,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: Dimensions.paddingSizeDefault,
                ),
                child: TitleRowWidget(
                  title: getTranslated('featured_products', context),
                  onTap: () => RouterHelper.getViewAllProductScreenRoute(productType: ProductType.featuredProduct, action: RouteAction.push),
                ),
              ),

              // CarouselSlider.builder(
              //   options: CarouselOptions(
              //     aspectRatio: 1.4,
              //
              //     viewportFraction: 0.48,
              //
              //     autoPlay: true,
              //     enlargeCenterPage: false,
              //
              //     padEnds: false,
              //
              //     disableCenter: true,
              //   ),
              //   itemCount: featuredProductModel?.products?.length ?? 0,
              //   itemBuilder: (context, index, next) {
              //     final product = featuredProductModel!.products![index];
              //
              //     return Padding(
              //       padding: EdgeInsets.only(
              //         left: index == 0 ? 12.0 : 0.0,
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
              //             // Image Section (flex: 3)
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
              //             // Details Section (flex: 1)
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
              //                         // Heart Icon ditto placement
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
              // ),
              // CarouselSlider.builder(
              //   options: CarouselOptions(
              //     // ✅ GAP FIX: 1.4 ya 1.45 aspectRatio rakhne se niche ka extra space nahi aayega
              //     aspectRatio: 1.45,
              //
              //     // ✅ VIEWPORT FIX: 0.47 karne se card thoda narrow hoga aur left margin ke liye jagah banegi
              //     viewportFraction: 0.47,
              //
              //     autoPlay: true,
              //     enlargeCenterPage: false,
              //
              //     // ✅ ALIGNMENT: Pehla card left se hi start hona chahiye
              //     padEnds: false,
              //
              //     disableCenter: true,
              //   ),
              //   itemCount: featuredProductModel?.products?.length ?? 0,
              //   itemBuilder: (context, index, next) {
              //     final product = featuredProductModel!.products![index];
              //
              //     return Padding(
              //       // ✅ LITTLE BIT LEFT MARGIN:
              //       // Index 0 (pehla card) ko 16.0 margin diya hai taaki wo kone se hat jaye.
              //       // Baki cards ke beech 10.0 ka premium gap rakha hai.
              //       padding: EdgeInsets.only(
              //         left: index == 0 ? 16.0 : 10.0,
              //         right: 0.0,
              //       ),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.zero, // Sharp corners
              //           color: Theme.of(context).cardColor,
              //           // Halki shadow taaki card premium dikhe
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey.withOpacity(0.1),
              //               spreadRadius: 1,
              //               blurRadius: 3,
              //               offset: const Offset(0, 1),
              //             )
              //           ],
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             // Image Section (flex: 3)
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
              //             // Details Section (flex: 1)
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
              //                         // Heart Icon
              //                         SizedBox(
              //                           height: 22, width: 22,
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
              // ),

              CarouselSlider.builder(
                options: CarouselOptions(
                  // ✅ Code 1 se match karne ke liye Aspect Ratio aur Viewport update kiya
                  aspectRatio: 1.4,
                  viewportFraction: 0.45,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  padEnds: false, // Pehla card left se shuru hoga
                  disableCenter: true,
                ),
                itemCount: featuredProductModel?.products?.length ?? 0,
                itemBuilder: (context, index, next) {
                  final product = featuredProductModel!.products![index];

                  return Padding(
                    // ✅ LEFT MARGIN MATCHED: Latest Product ke 16px (Default) margin se match karne ke liye
                    padding: EdgeInsets.only(
                      left: index == 0 ? Dimensions.paddingSizeDefault : 16.0,
                      right: 0.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero, // Latest Products ki tarah sharp corners
                        color: Theme.of(context).cardColor,
                        // Shadow hata di hai taaki look clean aur consistent rahe
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
                              // ✅ Details padding (5, 8, 5, 5) match ki gayi
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
                                          // ✅ Bold style aur 16 size as per Latest Product
                                          // style: robotoBold.copyWith(color: Colors.black, fontSize: 16),
                                          style: robotoBold.copyWith(
                                            color: Theme.of(context).textTheme.bodyLarge?.color, // Isse black background par white dikhega
                                            fontSize: 16,
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
                                    // ✅ Regular style, 12 size aur grey color
                                    // style: textRegular.copyWith(fontSize: 12, color: Colors.grey[600]),
                                    style: textRegular.copyWith(
                                      fontSize: 12,
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                    ),
                                    maxLines: 2, // Latest Product ki tarah 2 lines
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
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall)
            ]),
          ) : featuredProductModel == null ? const SliderProductShimmerWidget() : const SizedBox();
        });
  }
}