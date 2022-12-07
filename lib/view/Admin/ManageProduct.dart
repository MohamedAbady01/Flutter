import 'package:flutter/material.dart';
import 'package:shop_app/styles/colors/colors.dart';
import 'package:shop_app/view/components/custom_button.dart';
import 'package:shop_app/view/components/custom_text_field.dart';

class DeleteProduct extends StatelessWidget {
  var _name, _price, _description, _category, _imageLocation;
  static String id = 'ManageProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SHOPPY",
          style: TextStyle(color: AppColors.secondPrimaryColor),
        ),
      ),
      body:
      Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Divider(
            thickness: 1.5,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            labelText: "Product Name",
            hintText: "Enter you Product Name",
            onClick: (value) {
              _name = value;
            },
            prefixIcon: Icons.shopping_basket_sharp,
            validate: (String? value) {
              if (value == null || value.isEmpty) {
                return "enter an Product Name";
              } else {
                return "enter a valid email";
              }
            },


          ),
          SizedBox(height: 20),
          CustomTextFormField(
            controller: TextEditingController(),
            keyboardType: TextInputType.number,
            labelText: "Product ID",
            hintText: "Enter you ID",
            prefixIcon: Icons.important_devices,
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
          SizedBox(height: 20),



          CustomButton(onPress: () {}, text: 'DeleteProduct',),

        ],
      ),
    );
  }
}