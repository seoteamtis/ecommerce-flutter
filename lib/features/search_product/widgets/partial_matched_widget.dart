import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/features/search_product/controllers/search_product_controller.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/show_custom_snakbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SearchSuggestion extends StatefulWidget{
  final bool fromCompare;
  final int? id;
  const SearchSuggestion({super.key,  this.fromCompare = false, this.id});
  @override
  State<SearchSuggestion> createState() => _SearchSuggestionState();
}

class _SearchSuggestionState extends State<SearchSuggestion> {
  @override
  void initState() {
    super.initState();

    Future.delayed((const Duration(milliseconds: 500))).then((_) {
      FocusScope.of(Get.context!).requestFocus(Provider.of<SearchProductController>(Get.context!, listen: false).searchFocusNode);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      child: Consumer<SearchProductController>(
        builder: (context, searchProvider, _) {
          return SizedBox(height: 56,
            child: Padding(padding: const EdgeInsets.only(bottom: 8.0),
              child: Autocomplete(

                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty || searchProvider.suggestionModel == null) {
                    return const Iterable<String>.empty();
                  } else {
                    return searchProvider.nameList.where((word) => word.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                  }
                },
                optionsViewOpenDirection: OptionsViewOpenDirection.down,

                optionsViewBuilder: (context, Function(String) onSelected, options) {
                  return Material(elevation: 0,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final option = options.elementAt(index);
                        return InkWell(onTap: (){
                            if(widget.fromCompare){
                              searchProvider.setSelectedProductId(index, widget.id);
                              Navigator.of(context).pop();
                            }else{
                              searchProvider.searchProduct(query : option.toString(), offset: 1);
                              onSelected(option.toString());
                            }
                          },
                          child: Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                 Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                                   child: Icon(Icons.history, color: Theme.of(context).hintColor,size: 25)),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                  child: SubstringHighlight(
                                      text: option.toString(),
                                      textStyle: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha:.5), fontSize: Dimensions.fontSizeLarge),
                                      term: searchProvider.searchController.text,
                                      textStyleHighlight:  textMedium.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                                  ))),

                              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                                  child: Icon(CupertinoIcons.arrow_up_left, color: Theme.of(context).hintColor,size: 25))])));
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                      itemCount: options.length));
                },
                onSelected: (selectedString) {
                  if (kDebugMode) {
                    print(selectedString);
                  }
                },
                // fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                //   searchProvider.searchController = controller;
                //   searchProvider.searchFocusNode = focusNode;
                //
                //   return Hero(
                //     tag: 'search',
                //     child: Material(child: TextFormField(
                //         controller: controller,
                //         focusNode: searchProvider.searchFocusNode,
                //         textInputAction: TextInputAction.search,
                //         onChanged: (val){
                //           if(val.isNotEmpty){
                //             searchProvider.getSuggestionProductName(searchProvider.searchController.text.trim());
                //           }
                //         },
                //         onFieldSubmitted: (value) {
                //           if(controller.text.trim().isNotEmpty) {
                //             searchProvider.saveSearchAddress( controller.text.toString());
                //             searchProvider.searchProduct(query : controller.text.toString(), offset: 1);
                //           }else{
                //             showCustomSnackBarWidget(getTranslated('enter_somethings', context), context, snackBarType: SnackBarType.warning);
                //           }
                //         },
                //
                //         style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                //             borderSide: BorderSide(color: Colors.grey[300]!)),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                //             borderSide: BorderSide(color: Colors.grey[300]!)),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                //             borderSide: BorderSide(color: Colors.grey[300]!)),
                //           hintText: getTranslated('search_product', context),
                //          suffixIcon: SizedBox(width: controller.text.isNotEmpty? 70 : 50,
                //            child: Row(children: [
                //                if(controller.text.isNotEmpty)
                //                InkWell(onTap: (){
                //                  setState(() {
                //                    controller.clear();
                //                    searchProvider.cleanSearchProduct(notify: true);
                //                  });
                //                }, child: const Icon(Icons.clear, size: 20,)),
                //
                //
                //                InkWell(onTap: (){
                //                    if(controller.text.trim().isNotEmpty) {
                //                      focusNode.unfocus();
                //                        searchProvider.saveSearchAddress( controller.text.toString());
                //                        searchProvider.searchProduct( query : controller.text.toString(), offset: 1);
                //
                //                    }else{
                //                      showCustomSnackBarWidget(getTranslated('enter_somethings', context), context, snackBarType: SnackBarType.warning);
                //                    }
                //                  },
                //                  child: Padding(padding: const EdgeInsets.all(5),
                //                    child: Container(width: 40, height: 50,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                //                        borderRadius: const BorderRadius.all( Radius.circular(Dimensions.paddingSizeSmall))),
                //                        child: SizedBox(width : 18,height: 18, child: Padding(
                //                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                //                          child: Image.asset(Images.search, color: Colors.white),
                //                        ))),
                //                  ),
                //                ),
                //              ],
                //            ),
                //          )
                //         ),
                //       ),
                //     ),
                //   );
                // },

                fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                  searchProvider.searchController = controller;
                  searchProvider.searchFocusNode = focusNode;

                  return Hero(
                    tag: 'search',
                    child: Material(
                      color: Colors.transparent, // Background transparent rakha hai
                      child: TextFormField(
                        controller: controller,
                        focusNode: searchProvider.searchFocusNode,
                        textInputAction: TextInputAction.search,
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            searchProvider.getSuggestionProductName(searchProvider.searchController.text.trim());
                          }
                        },
                        onFieldSubmitted: (value) {
                          if (controller.text.trim().isNotEmpty) {
                            searchProvider.saveSearchAddress(controller.text.toString());
                            searchProvider.searchProduct(query: controller.text.toString(), offset: 1);
                          }
                        },
                        style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                        textAlignVertical: TextAlignVertical.center, // Text ko vertical center karne ke liye
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color(0xFFF2F2F2), // Exact light grey color
                          hintText: 'Search', // Image mein sirf Search likha hai
                          hintStyle: textRegular.copyWith(color: Colors.grey[600], fontSize: 16),

                          // Left side Search Icon (Padding ke sath taaki thoda center dikhe)
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search, color: Colors.black.withOpacity(0.7), size: 20),
                              ],
                            ),
                          ),

                          // Right side Camera Icon
                          suffixIcon: const Icon(Icons.camera_alt_outlined, color: Colors.black87, size: 20),

                          // Pill Shape Design (Round Corners)
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
