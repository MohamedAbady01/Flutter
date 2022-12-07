import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/styles/colors/colors.dart';
import 'package:shop_app/view/components/custom_button.dart';
import 'package:shop_app/view/components/custom_text_field.dart';

class PaymentGatewayScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      title: Text(
      "Pay With Card",
      style: TextStyle(color: AppColors.secondPrimaryColor),
    ),
    ),
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(controller: TextEditingController(),
              hintText: 'Please enter your Card Name ',
              labelText: 'Card Name', keyboardType: TextInputType.text,
              prefixIcon: Icons.person,
      ),
              SizedBox(height: 20),
              CustomTextFormField(controller: TextEditingController(),
                hintText: 'Please enter your Card Number ',
                labelText: 'Card Number', keyboardType: TextInputType.number,
                prefixIcon: Icons.payment,


              ),
              SizedBox(height: 20),
              CustomTextFormField(controller: TextEditingController(),
                hintText: 'CVV ',
                labelText: 'CVV', keyboardType: TextInputType.number,
                prefixIcon: Icons.pageview_rounded,


              ),
              SizedBox(height: 20),
              CustomTextFormField(controller: TextEditingController(),
                hintText: 'ExpairyDate ',
                labelText: 'ExpairyDate', keyboardType: TextInputType.datetime,
                prefixIcon: Icons.calendar_month,


              ),
              SizedBox(height: 20),
              CustomButton(onPress: () {}, text: 'Pay'),
            ],
          ),
        ),


    );
  }

}