import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/home/utils/dimensions.dart';
import 'package:food_delivery/features/home/widgets/big_text.dart';
import 'package:food_delivery/features/home/widgets/icon_and_text.dart';
import 'package:food_delivery/features/home/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController pageController = PageController(viewportFraction: 0.8);
  var _curPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageValue = pageController.page!;
        print('The current value is $_curPageValue'.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section
        SizedBox(
          height: 0.32.sh,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        SizedBox(height: 15.h),

        // Dots Indicator section
        DotsIndicator(
          dotsCount: 5,
          position: _curPageValue,
          decorator: DotsDecorator(
            activeColor: Theme.of(context).colorScheme.primary,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius5),
            ),
          ),
        ),

        // Popular
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.only(left: 30.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: const BigText(text: 'Popular'),
              ),
              SizedBox(width: 10.w),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: const BigText(text: '.')),
              SizedBox(width: 10.w),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: const SmallText(text: 'pairing'))
            ],
          ),
        ),

        SizedBox(height: 20.h),
        // List of popular food
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
              child: Row(
                children: [
                  // Image section
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white30,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/chan_ga_sot_thai.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text section
                  Expanded(
                    child: Container(
                      height: 85,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BigText(text: 'Chân gà sốt thái', size: 25),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndText(
                                  color: Colors.yellow,
                                  text: 'Normal',
                                  icon: Icons.circle_sharp,
                                ),
                                IconAndText(
                                  color: Colors.red,
                                  text: '20km',
                                  icon: Icons.location_on,
                                ),
                                IconAndText(
                                  color: Colors.blue,
                                  text: '30 phút',
                                  icon: Icons.access_time,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 2.5.h),
                                  child: Text(
                                    '25.000',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '20.000',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _curPageValue.floor()) {
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_curPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curPageValue.floor() - 1) {
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currSacle = 0.8;
      matrix = Matrix4.diagonal3Values(1, currSacle, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height: 0.25.sh,
              margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                color: index.isEven
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/chan_ga_sot_thai.jpg'),
                  fit: BoxFit.cover,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.16.sh,
              margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 5),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.w, top: 15.h, right: 20.w, bottom: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: 'Đồ ăn vặt'),
                    Row(
                      children: [
                        Row(
                          children: [
                            ...List.generate(5, (index) {
                              return Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.star,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 18.sp,
                                ),
                              );
                            }),
                            SizedBox(width: 15.w),
                            const SmallText(text: "4.5"),
                            SizedBox(width: 15.w),
                            const SmallText(text: "26"),
                            SizedBox(width: 5.w),
                            const SmallText(text: 'bình luận'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15.w),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndText(
                          color: Colors.yellow,
                          text: 'Normal',
                          icon: Icons.circle_sharp,
                        ),
                        IconAndText(
                          color: Colors.red,
                          text: '20km',
                          icon: Icons.location_on,
                        ),
                        IconAndText(
                          color: Colors.blue,
                          text: '30 phút',
                          icon: Icons.access_time,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
