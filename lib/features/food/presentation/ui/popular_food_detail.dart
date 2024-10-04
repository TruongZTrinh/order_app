import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/food/widgets/app_column.dart';
import 'package:food_delivery/features/food/widgets/app_icon.dart';
import 'package:food_delivery/features/home/widgets/big_text.dart';
import 'package:readmore/readmore.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 0.4.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/chan_ga_sot_thai.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          // Icon app
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 30.h,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios_rounded),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
          ),
          // Introduce section
          Positioned(
            left: 0,
            right: 0,
            top: 0.4.sh - 20,
            // bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Đồ ăn vặt - Đồng giá 20k', size: 50.sp),
                    SizedBox(height: 20.h),
                    BigText(
                      text: 'Introduce',
                      size: 40.sp,
                    ),
                    ReadMoreText(
                      'Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20.sp),
                      trimMode: TrimMode.Line,
                      trimLines: 4,
                      trimCollapsedText: 'Thêm',
                      trimExpandedText: 'Bớt',
                      colorClickableText: Colors.pink,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        height: 0.12.sh,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.black12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '0',
                    style: TextStyle(fontSize: 34.sp),
                  ),
                  SizedBox(width: 10.w),
                  const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: BigText(
                  text: 'Thêm vào giỏ hàng',
                  color: Colors.white,
                  size: 35.sp,
                )),
          ],
        ),
      ),
    );
  }
}
