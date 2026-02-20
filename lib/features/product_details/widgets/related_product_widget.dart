import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/controllers/product_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/widgets/latest_product/latest_product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/product_shimmer_widget.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../common/basewidget/custom_image_widget.dart';
import '../../../common/basewidget/title_row_widget.dart';
import '../../../helper/price_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/custom_themes.dart';
import 'favourite_button_widget.dart';

// class RelatedProductWidget extends StatelessWidget {
//   const RelatedProductWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Consumer<ProductController>(
//       builder: (context, prodProvider, child) {
//         return Column(children: [
//           prodProvider.relatedProductList != null ? prodProvider.relatedProductList!.isNotEmpty ?
//
//           SizedBox(
//             height: (prodProvider.relatedProductList?.length ?? 0) > 5 ? size.height * 0.35 : size.height * 0.16,
//             child: GridView.builder(
//               clipBehavior: Clip.none,
//               itemCount: prodProvider.relatedProductList?.length,
//               scrollDirection: Axis.horizontal,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: (prodProvider.relatedProductList?.length ?? 0) > 5 ? 2 : 1,
//                 crossAxisSpacing: 0,
//                 mainAxisSpacing: 0,
//                 childAspectRatio: 0.42,
//               ),
//               itemBuilder: (context, index) {
//
//                 final int crossAxisCount = (prodProvider.relatedProductList?.length ?? 0) > 5 ? 2 : 1;
//
//                 final columnIndex = index ~/ crossAxisCount;
//
//                 final lastColumnIndex = ((prodProvider.relatedProductList?.length ?? 0) - 1) ~/ crossAxisCount;
//
//                 final isLastColumn = columnIndex == lastColumnIndex;
//
//                 return SizedBox(
//                   height: 100,
//                   child: Padding(
//                     padding: EdgeInsets.only(right: isLastColumn ? Dimensions.paddingSizeDefault : 0),
//                     child: LatestProductWidget(productModel: prodProvider.relatedProductList![index],)
//                   ),
//                 );
//               },
//             ),
//           )
//
//           // RepaintBoundary(
//           //   child: MasonryGridView.count(
//           //     crossAxisCount: ResponsiveHelper.isTab(context)? 3 : 2,
//           //     itemCount: prodProvider.relatedProductList!.length,
//           //     shrinkWrap: true,
//           //     physics: const NeverScrollableScrollPhysics(),
//           //     itemBuilder: (BuildContext context, int index) => ProductWidget(productModel: prodProvider.relatedProductList![index]),
//           //   ),
//           // )
//
//               :  const SizedBox() :
//           ProductShimmer(isHomePage: false, isEnabled: Provider.of<ProductController>(context).relatedProductList == null),
//         ]);
//       },
//     );
//   }
// }



class RelatedProductWidget extends StatelessWidget {
  const RelatedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, prodProvider, child) {
        return prodProvider.relatedProductList != null ? prodProvider.relatedProductList!.isNotEmpty ?
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          // Title Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            // child: TitleRowWidget(title: getTranslated('related_products', context)),
          ),

          // ✅ Updated to CarouselSlider (Featured Deals Style)
          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //     aspectRatio: 1.4, // Featured Deals match
          //     viewportFraction: 0.45,
          //     autoPlay: true,
          //     enlargeCenterPage: false,
          //     padEnds: false,
          //     disableCenter: true,
          //   ),
          //   itemCount: prodProvider.relatedProductList?.length,
          //   itemBuilder: (context, index, _) {
          //     final product = prodProvider.relatedProductList![index];
          //
          //     return Padding(
          //       padding: EdgeInsets.only(
          //         left: index == 0 ? Dimensions.paddingSizeDefault : 16.0,
          //         right: 0.0,
          //       ),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.zero,
          //           color: Theme.of(context).cardColor,
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             // Image Section
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
          //             // Details Section
          //             Expanded(
          //               flex: 1,
          //               child: Padding(
          //                 padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
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
          //                               discountType: product.discountType,
          //                               discount: product.discount,
          //                             ),
          //                             style: robotoBold.copyWith(color: Colors.black, fontSize: 16),
          //                           ),
          //                         ),
          //                         // Heart Icon properly aligned
          //                         SizedBox(
          //                           child: FavouriteButtonWidget(
          //                             backgroundColor: Colors.transparent,
          //                             productId: product.id,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     const SizedBox(height: 4),
          //                     Text(
          //                       product.name ?? '',
          //                       style: textRegular.copyWith(fontSize: 12, color: Colors.grey[600]),
          //                       maxLines: 2,
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
              aspectRatio: 1.1,
              viewportFraction: 0.45,
              autoPlay: true,
              enlargeCenterPage: false,
              padEnds: false,
              disableCenter: true,
            ),
            itemCount: prodProvider.relatedProductList?.length,
            itemBuilder: (context, index, _) {
              final product = prodProvider.relatedProductList![index];

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

                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
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
                                style: textRegular.copyWith(fontSize: 11, color: Colors.grey[600]),
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
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault),
        ]) : const SizedBox() : const ProductShimmer(isHomePage: false, isEnabled: true);
      },
    );
  }
}