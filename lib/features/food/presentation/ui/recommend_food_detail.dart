import 'package:flutter/material.dart';
import 'package:food_delivery/features/food/widgets/app_icon.dart';
import 'package:food_delivery/features/home/widgets/big_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class RecommendFoodDetail extends StatelessWidget {
  const RecommendFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 0.12.sh,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.close),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                color: Colors.white,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const BigText(text: 'Chân gà sốt thái'),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.blueAccent,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/chan_ga_sot_thai.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: const ReadMoreText(
                    'Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng, Chân gà sốt Thái là một món ăn vặt vô cùng hấp dẫn, kết hợp giữa vị chua cay đặc trưng của ẩm thực Thái Lan với độ giòn dai của chân gà, tạo nên một hương vị khó cưỡng',
                    trimCollapsedText: 'Xem Thêm',
                    trimExpandedText: 'Bớt',
                    colorClickableText: Colors.pinkAccent,
                    trimLength: 400,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(icon: Icons.remove),
                SizedBox(width: 10.w),
                const BigText(text: '20.000  X1'),
                SizedBox(width: 10.w),
                const AppIcon(icon: Icons.add),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: const AppIcon(icon: Icons.favorite_border)),
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
        ],
      ),
    );
  }
}
