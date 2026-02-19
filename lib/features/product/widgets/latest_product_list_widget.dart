// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/slider_product_shimmer_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/features/product/controllers/product_controller.dart';
// import 'package:flutter_sixvalley_ecommerce/features/product/domain/models/product_model.dart';
// import 'package:flutter_sixvalley_ecommerce/features/product/enums/product_type.dart';
// import 'package:flutter_sixvalley_ecommerce/features/product/widgets/latest_product/latest_product_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
// import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
// import 'package:flutter_sixvalley_ecommerce/common/basewidget/title_row_widget.dart';
// import 'package:provider/provider.dart';
//
//
// class LatestProductListWidget extends StatelessWidget {
//   const LatestProductListWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<ProductController, ProductModel?>(
//       selector: (ctx, productController)=> productController.latestProductModel,
//       builder: (context, latestProductModel, child) {
//
//         final size = MediaQuery.of(context).size;
//
//         return (latestProductModel?.products?.isNotEmpty ?? false)  ? Container(
//           padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//           color: Theme.of(context).cardColor,
//           child: Column( children: [
//             TitleRowWidget(
//               title: getTranslated('latest_products', context),
//               onTap: () => RouterHelper.getViewAllProductScreenRoute(productType: ProductType.latestProduct, action: RouteAction.push),
//             ),
//
//             const SizedBox(height: Dimensions.paddingSizeSmall),
//
//
//
//             SizedBox(
//               height: (latestProductModel?.products?.length ?? 0) > 5 ? size.height * 0.35 : size.height * 0.16,
//               child: GridView.builder(
//                 clipBehavior: Clip.none,
//                 itemCount: latestProductModel?.products?.length,
//                 scrollDirection: Axis.horizontal,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: (latestProductModel?.products?.length ?? 0) > 5 ? 2 : 1,
//                   crossAxisSpacing: Dimensions.paddingSizeExtraSmall,
//                   mainAxisSpacing: Dimensions.paddingSizeExtraSmall,
//                   childAspectRatio: 0.40,
//                 ),
//                 itemBuilder: (context, index) {
//
//                   final int crossAxisCount = (latestProductModel?.products?.length ?? 0) > 5 ? 2 : 1;
//
//                   final columnIndex = index ~/ crossAxisCount;
//
//                   final lastColumnIndex = ((latestProductModel?.products?.length ?? 0) - 1) ~/ crossAxisCount;
//
//                   final isLastColumn = columnIndex == lastColumnIndex;
//
//                   return SizedBox(
//                     height: 100,
//                     child: Padding(
//                       padding: EdgeInsets.only(right: isLastColumn ? Dimensions.paddingSizeDefault : 0),
//                       child: LatestProductWidget(productModel: latestProductModel!.products![index],)
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ]),
//         ) : latestProductModel == null ? const SliderProductShimmerWidget() : const SizedBox();
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/slider_product_shimmer_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/controllers/product_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/domain/models/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/enums/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/widgets/latest_product/latest_product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/helper/route_healper.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/title_row_widget.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_image_widget.dart';
import 'package:provider/provider.dart';

import '../../../helper/price_converter.dart';
import '../../../utill/custom_themes.dart';
import '../../product_details/widgets/favourite_button_widget.dart';

// class LatestProductListWidget extends StatelessWidget {
//   const LatestProductListWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<ProductController, ProductModel?>(
//       selector: (ctx, productController) => productController.latestProductModel,
//       builder: (context, latestProductModel, child) {
//
//         return (latestProductModel?.products?.isNotEmpty ?? false) ? Container(
//           padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//           color: Theme.of(context).cardColor,
//           child: Column(children: [
//
//             // a) Title and View All on top
//             TitleRowWidget(
//               title: getTranslated('latest_products', context),
//               onTap: () => RouterHelper.getViewAllProductScreenRoute(
//                 productType: ProductType.latestProduct,
//                 action: RouteAction.push,
//               ),
//             ),
//             const SizedBox(height: Dimensions.paddingSizeSmall),
//
//             // b) Static Image (Badi Fashion Photo)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
//                 // child: const CustomImageWidget(
//                 //   // Yahan aap apni pasand ki static image ka URL ya path daal sakte hain
//                 //   image: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=2070&auto=format&fit=crop',
//                 //   height: 250,
//                 //   width: double.infinity,
//                 //   fit: BoxFit.cover,
//                 // ),
//               ),
//             ),
//             const SizedBox(height: Dimensions.paddingSizeDefault),
//
//             // c) Product Card Slider Underneath (Horizontal Scroll)
//             SizedBox(
//               height: 260, // Slider ki height
//               child: ListView.builder(
//                 itemCount: latestProductModel?.products?.length,
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 150, // Card ki width
//                     margin: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
//                     child: LatestProductWidget(
//                       productModel: latestProductModel!.products![index],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ]),
//         ) : latestProductModel == null ? const SliderProductShimmerWidget() : const SizedBox();
//       },
//     );
//   }
// }

class LatestProductListWidget extends StatelessWidget {
  const LatestProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ProductController, ProductModel?>(
      selector: (ctx, productController) => productController.latestProductModel,
      builder: (context, latestProductModel, child) {

        return (latestProductModel?.products?.isNotEmpty ?? false) ? Container(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
          color: Theme.of(context).cardColor,
          child: Column(children: [

            TitleRowWidget(
              title: getTranslated('latest_products', context),
              onTap: () => RouterHelper.getViewAllProductScreenRoute(
                productType: ProductType.latestProduct,
                action: RouteAction.push,
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            SizedBox(

              height: 285,
              child: ListView.builder(
                itemCount: latestProductModel?.products?.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = latestProductModel!.products![index];

                  return Container(
                    width: 155,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: CustomImageWidget(
                            image: '${product.thumbnailFullUrl?.path}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),

                        Padding(
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
                                      PriceConverter.convertPrice(context, product.unitPrice),
                                      style: robotoBold.copyWith(color: Colors.black, fontSize: 16),
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
                                style: textRegular.copyWith(fontSize: 12, color: Colors.grey[600]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        ) : latestProductModel == null ? const SliderProductShimmerWidget() : const SizedBox();
      },
    );
  }
}