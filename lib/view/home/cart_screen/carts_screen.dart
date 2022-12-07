import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/cart/cart_cubit.dart';
import 'package:shop_app/services/methods/navigation.dart';
import 'package:shop_app/styles/text_styles/app_text_styles.dart';
import 'package:shop_app/view/PaymentGatewayScreen.dart';
import 'package:shop_app/view/components/custom_button.dart';
import 'package:shop_app/view/home/search_screen.dart';

import 'cart_item.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Cart items"),
            actions: [
              Stack(

                children: [


                  IconButton(

                      onPressed: () {
                        navigateWithBack(context, PaymentGatewayScreen());
                      },

                      icon: Icon(
                        Icons.paypal,
                        color: Colors.grey.shade600,
                      ),

                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Payment',
                      style: TextStyle(


                      ),),
                  ),

                ],
              ),
            ],
          ),
            body: (cubit.userCarts == null)
                ? const Center(child: CircularProgressIndicator())
                : (cubit.userCarts!.data.cartItems.isEmpty)
                    ? Center(
                        child: Text(
                          "No Items to show",
                          style: AppTextStyles.subTitle,
                        ),
                      )
                    : Padding(

                        padding: const EdgeInsets.all(20.0),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.userCarts!.data.cartItems.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (context, index) => CartItem(
                              cart: cubit.userCarts!.data.cartItems[index]),
                        ),

                      ),


        );
      },

    );
  }
}
