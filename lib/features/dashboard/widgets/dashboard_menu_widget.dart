import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:flutter_sixvalley_ecommerce/helper/responsive_helper.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../utill/images.dart';

class CustomMenuWidget extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String icon;
  final bool showCartCount;
  final VoidCallback onTap;

  const CustomMenuWidget({
    super.key, required this.isSelected,
    required this.name, required this.icon,
    required this.onTap, this.showCartCount = false,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return InkWell(
  //     highlightColor: Colors.transparent,
  //     hoverColor: Colors.transparent,
  //     onTap: onTap,
  //     child: Padding(padding: const EdgeInsets.all(8),
  //       child: SizedBox(width: isSelected ? 90 : 50, child: Column(crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
  //
  //           Stack(children: [
  //             Image.asset(
  //               icon, color: isSelected? Theme.of(context).primaryColor : Theme.of(context).hintColor,
  //               width: Dimensions.menuIconSize, height: Dimensions.menuIconSize,
  //             ),
  //
  //             if(showCartCount) Positioned.fill(child: Container(
  //               transform: Matrix4.translationValues(5, -3, 0),
  //               child: Align(
  //                 alignment: Alignment.topRight,
  //                 child: Consumer<CartController>(builder: (context, cart, child) {
  //                   return (cart.cartList.isNotEmpty) ? CircleAvatar(
  //                       radius: ResponsiveHelper.isTab(context)? 10 :  7,
  //                       backgroundColor: Theme.of(context).colorScheme.error,
  //                       child: Text(cart.cartList.length.toString(), style: titilliumSemiBold.copyWith(
  //                         color:  Theme.of(context).colorScheme.secondaryContainer,
  //                         fontSize: Dimensions.fontSizeExtraSmall,
  //                       ))) : SizedBox();
  //                 }),
  //               ),
  //             )),
  //
  //           ]),
  //
  //           isSelected ?
  //           Text(getTranslated(name, context)!, maxLines: 1, overflow: TextOverflow.ellipsis,
  //               style: textBold.copyWith(color:  Theme.of(context).primaryColor)) :
  //
  //           Text(getTranslated(name, context)!, maxLines: 1, overflow: TextOverflow.ellipsis,
  //               style: textRegular.copyWith(color: Theme.of(context).hintColor)),
  //
  //           if(isSelected)
  //             Container(width: 5,height: 3,
  //               decoration: BoxDecoration(color: Theme.of(context).primaryColor,
  //                   borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)))
  //         ],
  //       )),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Center( // Column ki jagah Center use karein taaki overflow na ho
        child: Stack(clipBehavior: Clip.none, children: [
          // Image.asset(
          //   icon,
          //   // color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
          //   color: isSelected ? const Color(0xFF3F2182) : Theme.of(context).hintColor,
          //   width: Dimensions.menuIconSize,
          //   height: Dimensions.menuIconSize,
          // ),
          Image.asset(
            icon,
            color: (icon == Images.logoWithNameImage)
                ? null
                : (isSelected ? const Color(0xFF3F2182) : Theme.of(context).hintColor),

            // Agar Gidi Logo hai toh size 35 rakhein, baaki icons ke liye standard size
            width: (icon == Images.logoWithNameImage)
                ? 35
                : Dimensions.menuIconSize,

            height: (icon == Images.logoWithNameImage)
                ? 35
                : Dimensions.menuIconSize,
          ),

          if(showCartCount) Positioned(
            top: -3, right: -5, // Badge ki position set karne ke liye
            child: Consumer<CartController>(builder: (context, cart, child) {
              return (cart.cartList.isNotEmpty) ? CircleAvatar(
                  radius: ResponsiveHelper.isTab(context) ? 10 : 7,
                  backgroundColor: Theme.of(context).colorScheme.error,
                  child: Text(cart.cartList.length.toString(), style: titilliumSemiBold.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontSize: Dimensions.fontSizeExtraSmall,
                  ))) : const SizedBox();
            }),
          ),

          // Niche wala indicator (Chhota dot) agar dikhana hai toh:
          if(isSelected) Positioned(
            bottom: -8, left: 0, right: 0,
            child: Center(
              child: Container(width: 5, height: 3,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault))),
            ),
          )
        ]),
      ),
    );
  }

}