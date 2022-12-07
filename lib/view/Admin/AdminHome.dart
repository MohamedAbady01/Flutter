import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/services/methods/navigation.dart';
import 'package:shop_app/styles/colors/colors.dart';
import 'package:shop_app/view/Admin/AddProduct.dart';
import 'package:shop_app/view/Admin/ManageProduct.dart';
import 'package:shop_app/view/Admin/Update.dart';
import 'package:shop_app/view/components/custom_button.dart';
import 'package:shop_app/view/home/category_products_screen.dart';
import 'package:shop_app/view/home/home_layout.dart';
import 'package:shop_app/view/home/search_screen.dart';

class AdminHomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
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
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              onPress: () {

                navigateWithBack(context, AddProductScreen());
              },
              text: 'Add Product',
            ),
            SizedBox(height: 20),
            CustomButton(
              onPress: () {
                navigateWithBack(context, DeleteProduct());
              },
              text:'Delete Product',
            ),
            SizedBox(height: 20),
            CustomButton(
              onPress: () {
                navigateWithBack(context, UpdateProductScreen());
              },
              text: 'Update Product',
            ),
            SizedBox(height: 20),
            CustomButton(
              onPress: () {
                navigateWithBack(context,  HomeLayout());
              },
              text: 'View orders',
            )
          ],
        ),
      ),
    );
  }
}
