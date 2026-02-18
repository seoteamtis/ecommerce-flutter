import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/domain/models/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/controllers/localization_controller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/theme/controllers/theme_controller.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/product_details/widgets/favourite_button_widget.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
import 'package:provider/provider.dart';


// class SliderProductWidget extends StatelessWidget {
//   final Product product;
//   final bool isCurrentIndex;
//   const SliderProductWidget({super.key, required this.product, this.isCurrentIndex = true});
//
//   @override
//   Widget build(BuildContext context) {
//
//     bool isLtr = Provider.of<LocalizationController>(context, listen: false).isLtr;
//     double ratting = (product.rating?.isNotEmpty ?? false) ?  double.parse('${product.rating?[0].average}') : 0;
//
//     return InkWell(onTap: () {
//       RouterHelper.getProductDetailsRoute(
//         action: RouteAction.push,
//         productId: product.id,
//         slug: product.slug,
//         fromFlashDeals: true,
//       );
//     },
//       child: AnimatedContainer(
//         margin:  EdgeInsets.symmetric(vertical : isCurrentIndex ? Dimensions.paddingSizeExtraSmall : 45),
//         decoration: BoxDecoration(
//           // borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
//           borderRadius: BorderRadius.zero,
//           color: Theme.of(context).cardColor,
//           border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
//           boxShadow: [
//             BoxShadow(color: Theme.of(context).primaryColor.withValues(alpha:0.05), blurRadius: 10, spreadRadius: 0, offset: const Offset(0, 0) )
//           ],
//         ),
//         duration: const Duration(milliseconds: 500),
//         // curve: Curves.easeInCubic,z
//         child: Stack(children: [
//           SingleChildScrollView(
//             physics: const NeverScrollableScrollPhysics(),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//                 Padding(
//                 padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                 child: LayoutBuilder(
//                     builder: (context, constrains) {
//                       return Stack(children: [
//                         Container(
//                           width: constrains.maxWidth,
//                           height:constrains.maxWidth * 0.9,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha:.1)),
//                             color: Theme.of(context).highlightColor,
//                             // borderRadius: const BorderRadius.all(Radius.circular(10)),
//                             borderRadius: BorderRadius.zero,
//                           ),
//                           child: ClipRRect(
//                             // borderRadius: const BorderRadius.all( Radius.circular(10)),
//                             borderRadius: BorderRadius.zero,
//                             child: Stack(
//                               children: [
//                                 CustomImageWidget(
//                                   image: '${product.thumbnailFullUrl?.path}',
//                                   width: constrains.maxWidth,
//                                   height:constrains.maxWidth * 0.9,
//                                 ),
//
//                                 if(product.currentStock! == 0 && product.productType == 'physical')...[
//                                   Container(
//                                     color: Colors.black.withValues(alpha:0.4),
//                                   ),
//
//                                   Positioned.fill(child: Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Container(
//                                       width: constrains.maxWidth,
//                                       decoration: BoxDecoration(
//                                           color: Theme.of(context).colorScheme.error.withValues(alpha:0.4),
//                                           borderRadius: const BorderRadius.only(
//                                             topLeft: Radius.circular(Dimensions.radiusSmall),
//                                             topRight: Radius.circular(Dimensions.radiusSmall),
//                                           )
//                                       ),
//                                       child: Text(
//                                         getTranslated('out_of_stock', context)??'',
//                                         style: textBold.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   )),
//                                 ],
//                               ],
//                             ),
//                           ),
//                         ),
//
//
//
//                         // if(isCurrentIndex) ...[
//                         //   // ((product.discount! > 0) || (product.clearanceSale != null)) ?
//                         //   // DiscountTagWidget(product: product) : const SizedBox.shrink(),
//                         //
//                         //   Positioned.fill(child: Align(
//                         //     alignment: isLtr ? Alignment.topRight : Alignment.topLeft,
//                         //     child: Padding(
//                         //       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall, vertical: Dimensions.paddingSizeExtraSmall),
//                         //       child: FavouriteButtonWidget(
//                         //         backgroundColor: Provider.of<ThemeController>(context).darkTheme
//                         //           ? Theme.of(context).cardColor
//                         //           : Theme.of(context).primaryColor,
//                         //         productId: product.id,
//                         //       ),
//                         //     ),
//                         //   )),
//                         // ],
//
//                         Positioned.fill(child: Align(
//                           alignment: isLtr ? Alignment.topLeft : Alignment.topRight,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall, vertical: Dimensions.paddingSizeSmall),
//                             child: Image.asset(Images.flashDeal, scale: 3),
//                           ),
//                         )),
//                       ]);
//                     }
//                 ),
//               ),
//
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
//               //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               //
//               //     if(ratting > 0) Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               //       const Icon(Icons.star_rate_rounded, color: Colors.orange, size: Dimensions.paddingSizeDefault),
//               //
//               //       Padding(
//               //         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//               //         child: Text(ratting.toStringAsFixed(1), style: textRegular.copyWith(
//               //           fontSize: Dimensions.fontSizeSmall,
//               //           color: Theme.of(context).textTheme.bodyLarge?.color,
//               //         )),
//               //       ),
//               //
//               //       Text('(${PriceConverter.longToShortPrice(product.reviewCount?.toDouble() ?? 0, withDecimalPoint: false)})', style: textRegular.copyWith(
//               //           fontSize: Dimensions.fontSizeSmall,
//               //           color: Theme.of(context).hintColor),
//               //       ),
//               //     ]),
//               //
//               //     Text(product.name ?? '', textAlign: TextAlign.center, style: textMedium.copyWith(
//               //       fontSize: Dimensions.fontSizeDefault,
//               //       color: Theme.of(context).textTheme.bodyLarge?.color,
//               //     ), maxLines: 1, overflow: TextOverflow.ellipsis),
//               //
//               //     if(hasDiscount())
//               //       Text(PriceConverter.convertPrice(context, product.unitPrice), style: titleRegular.copyWith(
//               //         color: Theme.of(context).hintColor,
//               //         decoration: TextDecoration.lineThrough,
//               //         decorationColor: Theme.of(context).hintColor,
//               //         fontSize: Dimensions.fontSizeSmall,
//               //       )),
//               //
//               //     Text(
//               //       PriceConverter.convertPrice(
//               //         context, product.unitPrice,
//               //         discountType: (product.clearanceSale?.discountAmount ?? 0)  > 0
//               //           ? product.clearanceSale?.discountType
//               //           : product.discountType,
//               //         discount: (product.clearanceSale?.discountAmount ?? 0)  > 0
//               //           ? product.clearanceSale?.discountAmount
//               //           : product.discount,
//               //       ),
//               //       style: robotoBold.copyWith(color:  Provider.of<ThemeController>(context).darkTheme ?
//               //       Theme.of(context).textTheme.bodyLarge?.color :
//               //       Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeDefault),
//               //     ),
//               //
//               //   ]),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//                   if(ratting > 0) Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                     const Icon(Icons.star_rate_rounded, color: Colors.orange, size: Dimensions.paddingSizeDefault),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                       child: Text(ratting.toStringAsFixed(1), style: textRegular.copyWith(
//                         fontSize: Dimensions.fontSizeSmall,
//                         color: Theme.of(context).textTheme.bodyLarge?.color,
//                       )),
//                     ),
//                     Text('(${PriceConverter.longToShortPrice(product.reviewCount?.toDouble() ?? 0, withDecimalPoint: false)})', style: textRegular.copyWith(
//                         fontSize: Dimensions.fontSizeSmall,
//                         color: Theme.of(context).hintColor),
//                     ),
//                   ]),
//
//                   // --- Price aur Heart Icon ki Row (YEH RAHI CHANGES) ---
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween, // Isse Price left aur Heart right ho jayega
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if(hasDiscount())
//                               Text(PriceConverter.convertPrice(context, product.unitPrice), style: titleRegular.copyWith(
//                                 color: Theme.of(context).hintColor,
//                                 decoration: TextDecoration.lineThrough,
//                                 fontSize: Dimensions.fontSizeSmall,
//                               )),
//
//                             Text(
//                               PriceConverter.convertPrice(
//                                 context, product.unitPrice,
//                                 discountType: (product.clearanceSale?.discountAmount ?? 0)  > 0
//                                     ? product.clearanceSale?.discountType
//                                     : product.discountType,
//                                 discount: (product.clearanceSale?.discountAmount ?? 0)  > 0
//                                     ? product.clearanceSale?.discountAmount
//                                     : product.discount,
//                               ),
//                               style: robotoBold.copyWith(
//                                   color: Provider.of<ThemeController>(context).darkTheme ?
//                                   Theme.of(context).textTheme.bodyLarge?.color :
//                                   Theme.of(context).primaryColor,
//                                   fontSize: Dimensions.fontSizeDefault
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // ✅ Heart Icon ab Price ke ekdum bagal mein (Bottom-Right) dikhega
//                       FavouriteButtonWidget(
//                         backgroundColor: Colors.transparent, // Background transparent rakha hai jaisa image mein tha
//                         productId: product.id,
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 4),
//
//                   // Product Name ko Price ke niche rakha hai
//                   Text(product.name ?? '', textAlign: TextAlign.start, style: textMedium.copyWith(
//                     fontSize: Dimensions.fontSizeDefault,
//                     color: Theme.of(context).textTheme.bodyLarge?.color,
//                   ), maxLines: 1, overflow: TextOverflow.ellipsis),
//
//                 ]),
//               ),
//             ]),
//           ),
//         ]),
//       ),
//     );
//   }
//
//
//   bool hasDiscount() => (product.discount != null && product.discount! > 0) || (product.clearanceSale?.discountAmount ?? 0) > 0;
// }


// slider_product_widget.dart

// class SliderProductWidget extends StatelessWidget {
//   final Product product;
//   final bool isCurrentIndex;
//   const SliderProductWidget({super.key, required this.product, this.isCurrentIndex = true});
//
//   @override
//   Widget build(BuildContext context) {
//     bool isLtr = Provider.of<LocalizationController>(context, listen: false).isLtr;
//     double ratting = (product.rating?.isNotEmpty ?? false) ?  double.parse('${product.rating?[0].average}') : 0;
//
//     return InkWell(
//       onTap: () {
//         RouterHelper.getProductDetailsRoute(
//           action: RouteAction.push,
//           productId: product.id,
//           slug: product.slug,
//           fromFlashDeals: true,
//         );
//       },
//       child: AnimatedContainer(
//         // ✅ CHANGE 1: Margin ko dono jagah same (Dimensions.paddingSizeExtraSmall) kar diya hai
//         // margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
//         margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: Dimensions.paddingSizeExtraSmall),
//
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.zero,
//           color: Theme.of(context).cardColor,
//           border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
//           // boxShadow: [
//           //   BoxShadow(color: Theme.of(context).primaryColor.withValues(alpha:0.05), blurRadius: 10, spreadRadius: 0, offset: const Offset(0, 0) )
//           // ],
//         ),
//         duration: const Duration(milliseconds: 500),
//         child: Stack(children: [
//           SingleChildScrollView(
//             physics: const NeverScrollableScrollPhysics(),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//               Padding(
//                 padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                 child: LayoutBuilder(
//                     builder: (context, constrains) {
//                       return Stack(children: [
//                         Container(
//                           width: constrains.maxWidth,
//                           // ✅ CHANGE 2: Height ko ek fix ratio de diya hai (0.9) taaki upar niche na ho
//                           height: constrains.maxWidth * 0.9,
//                           // decoration: BoxDecoration(
//                           //   border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha:.1)),
//                           //   color: Theme.of(context).highlightColor,
//                           //   borderRadius: BorderRadius.zero,
//                           // ),
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).highlightColor,
//                             borderRadius: BorderRadius.zero,
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.zero,
//                             child: CustomImageWidget(
//                               image: '${product.thumbnailFullUrl?.path}',
//                               width: constrains.maxWidth,
//                               height: constrains.maxWidth * 0.9,
//                               fit: BoxFit.cover, // Image barabar fit hogi
//                             ),
//                           ),
//                         ),
//
//                         // Flash Deal Icon
//                         Positioned.fill(child: Align(
//                           alignment: isLtr ? Alignment.topLeft : Alignment.topRight,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall, vertical: Dimensions.paddingSizeSmall),
//                             child: Image.asset(Images.flashDeal, scale: 3),
//                           ),
//                         )),
//                       ]);
//                     }
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//                   // Rating Section
//                   if(ratting > 0) Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                     const Icon(Icons.star_rate_rounded, color: Colors.orange, size: Dimensions.paddingSizeDefault),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                       child: Text(ratting.toStringAsFixed(1), style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
//                     ),
//                   ]),
//
//                   // Price aur Heart Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if(hasDiscount())
//                               Text(PriceConverter.convertPrice(context, product.unitPrice), style: titleRegular.copyWith(
//                                 color: Theme.of(context).hintColor,
//                                 decoration: TextDecoration.lineThrough,
//                                 fontSize: Dimensions.fontSizeSmall,
//                               )),
//
//                             Text(
//                               PriceConverter.convertPrice(context, product.unitPrice,
//                                 discountType: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountType : product.discountType,
//                                 discount: (product.clearanceSale?.discountAmount ?? 0) > 0 ? product.clearanceSale?.discountAmount : product.discount,
//                               ),
//                               style: robotoBold.copyWith(
//                                   color: Provider.of<ThemeController>(context).darkTheme ? Theme.of(context).textTheme.bodyLarge?.color : Theme.of(context).primaryColor,
//                                   fontSize: Dimensions.fontSizeDefault
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       FavouriteButtonWidget(
//                         backgroundColor: Colors.transparent,
//                         productId: product.id,
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 4),
//
//                   // Product Name
//                   Text(product.name ?? '', textAlign: TextAlign.start, style: textMedium.copyWith(
//                     fontSize: Dimensions.fontSizeDefault,
//                     color: Theme.of(context).textTheme.bodyLarge?.color,
//                   ), maxLines: 1, overflow: TextOverflow.ellipsis),
//                 ]),
//               ),
//             ]),
//           ),
//         ]),
//       ),
//     );
//   }
//
//   bool hasDiscount() => (product.discount != null && product.discount! > 0) || (product.clearanceSale?.discountAmount ?? 0) > 0;
// }

// lib/common/basewidget/slider_product_widget.dart

class SliderProductWidget extends StatelessWidget {
  final Product product;
  final bool isCurrentIndex;
  const SliderProductWidget({super.key, required this.product, this.isCurrentIndex = true});

  @override
  Widget build(BuildContext context) {
    bool isLtr = Provider.of<LocalizationController>(context, listen: false).isLtr;

    return InkWell(
      onTap: () {
        RouterHelper.getProductDetailsRoute(
          action: RouteAction.push,
          productId: product.id,
          slug: product.slug,
          fromFlashDeals: true,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero, // ✅ Sharp corners
          color: Theme.of(context).cardColor,
        ),
        // ✅ Column ko wrap nahi karna hai scroll se, Expanded use karenge
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ✅ FIX: Image ko Expanded mein dala taaki overflow na ho
              Expanded(
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: CustomImageWidget(
                      image: '${product.thumbnailFullUrl?.path}',
                      fit: BoxFit.cover, // ✅ Pure area ko cover karega
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),

                  // Flash Deal Tag
                  Positioned(
                    top: 5, left: isLtr ? 5 : null, right: !isLtr ? 5 : null,
                    child: Image.asset(Images.flashDeal, scale: 4),
                  ),
                ]),
              ),

              // ✅ Details Section (Fixed Height Area)
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
                child: Column(
                    mainAxisSize: MainAxisSize.min, // ✅ Sirf utni jagah lega jitni zaroorat hai
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Price aur Heart Row
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
                                color: Colors.black, // ✅ Premium dark price
                                fontSize: 15,
                              ),
                            ),
                          ),

                          // Outline Heart Icon
                          SizedBox(
                            height: 28, width: 28,
                            child: FavouriteButtonWidget(
                              backgroundColor: Colors.transparent,
                              productId: product.id,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 2),

                      // Product Name
                      Text(
                        product.name ?? '',
                        style: textRegular.copyWith(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}


// Positioned(
//   top: Dimensions.paddingSizeDefault,
//   child: Container(
//     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       color: ColorResources.getPrimary(context),
//       borderRadius: BorderRadius.only(
//         topRight: isLtr ? const Radius.circular(5) : Radius.zero,
//         bottomRight: isLtr ? const Radius.circular(5) : Radius.zero,
//         topLeft: !isLtr ? const Radius.circular(5) : Radius.zero,
//         bottomLeft: !isLtr ? const Radius.circular(5) : Radius.zero,
//       ),
//     ),
//     child: Directionality(
//       textDirection: TextDirection.ltr,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
//         child: Text(
//           PriceConverter.percentageCalculation(context, product.unitPrice, product.discount, product.discountType),
//           style: textBold.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.fontSizeExtraSmall),
//         ),
//       ),
//     ),
//   ),
// ),

