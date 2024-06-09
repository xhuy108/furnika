import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/cart/presentation/cubit/cart_cubit.dart';

import 'package:furnika/features/cart/presentation/widgets/cart_list.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'My Cart',
        context: context,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              onPressed: () {
                context.pushNamed(RouteNames.checkout);
              },
              icon: SvgPicture.asset(MediaResource.checkoutIcon),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is CartLoaded) {
            if (state.cart.items.isEmpty) {
              return const Center(
                child: Text('No items in cart'),
              );
            }
            return CartList(
              cartItems: state.cart.items,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
