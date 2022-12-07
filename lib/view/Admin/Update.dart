import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/user_data/user_data_cubit.dart';
import 'package:shop_app/services/methods/navigation.dart';
import 'package:shop_app/styles/colors/colors.dart';
import 'package:shop_app/view/components/custom_button.dart';
import 'package:shop_app/view/components/custom_profile_image.dart';
import 'package:shop_app/view/components/custom_text_field.dart';
import 'package:shop_app/view/home/search_screen.dart';

class UpdateProductScreen extends StatelessWidget {
  static String id = 'AddProductScreen';
  var _name, _price, _description, _category, _imageLocation;
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = UserDataCubit.get(context);
          imageController.text = cubit.userDataResponse!.data!.image;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "SHOPPY",
                style: TextStyle(color: AppColors.secondPrimaryColor),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateWithBack(context, SearchScreen());
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                    )
                ),

              ],
            ),
            body:
            SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: (cubit.uploadedImage != null)
                        ? CustomProfileImage(
                      onPress: () {
                        cubit.uploadImage().then((value) {
                          if (cubit.uploadedImage !=
                              null) {
                            imageController.text = cubit
                                .uploadedImage!
                                .base64Image;
                          }
                        });
                      },
                      isFromFile: true,
                      imageFile:
                      cubit.uploadedImage!.file,
                    )
                        : CustomProfileImage(
                        onPress: () {
                          cubit.uploadImage().then((value) {
                            if (cubit.uploadedImage !=
                                null) {
                              imageController.text = cubit
                                  .uploadedImage!
                                  .base64Image;
                            }
                          });
                        },
                        isFromFile: false,
                        imageURL: cubit.userDataResponse!
                            .data!.image),
                  ),

                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    labelText: "Product ID",
                    hintText: "Enter  Product ID",
                    onClick: (value) {
                      _name = value;
                    },
                    prefixIcon: Icons.perm_identity_outlined,
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "enter an Product ID";
                      } else {
                        return "enter a valid ID";
                      }
                    },


                  ),
                  SizedBox(height: 20),

                  CustomTextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    labelText: "Product Name",
                    hintText: "Enter  Product Name",
                    onClick: (value) {
                      _name = value;
                    },
                    prefixIcon: Icons.shopping_basket_sharp,
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "enter an Product ID";
                      } else {
                        return "enter a valid ID";
                      }
                    },


                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    labelText: "Product Category",
                    hintText: "Enter you Category",
                    prefixIcon: Icons.category,
                    onClick: (value) {
                      _category = value;
                    },
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "enter an Product Category";
                      } else {
                        return "enter a valid Category";
                      }
                    },

                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    labelText: "Product Discription",
                    hintText: "Update Discription??",
                    prefixIcon: Icons.text_fields_rounded,
                    onClick: (value) {
                      _description = value;
                    },
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "enter an Product Category";
                      } else {
                        return "enter a valid Category";
                      }
                    },

                  ),


                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    labelText: "Product price",
                    hintText: "Update price ?? ",
                    prefixIcon: Icons.price_change,
                    onClick: (value) {
                      _price = value;
                    },
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "enter an Product Name";
                      } else {
                        return "enter a valid email";
                      }
                    },

                  ),



                  CustomButton(onPress: () {}, text: 'UpdateProduct',),

                ],
              ),
            ),
          );
        }
    );
  }
}