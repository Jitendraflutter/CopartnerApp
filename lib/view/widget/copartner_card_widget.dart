import 'package:assignment/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_image.dart';
import '../../logic/copartner_cubit.dart';
import '../../model/copartner_model.dart';

class CopartnerCardWidget extends StatelessWidget {
  final CopartnerList list;
  const CopartnerCardWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
     final controller=PageController(
      viewportFraction: 0.90,
      initialPage: 0,
    );
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff1D242D).withOpacity(0.44),
                Color(0xff1D242D).withOpacity(0.1),
              ])
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 15.r,right: 15.r,top: 10.r),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundImage:NetworkImage(
                        list.experts?.expertImagePath??""
                    )),
                SizedBox(width: 10.h,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(list.experts?.channelName??"",style:context.titleStyle.copyWith(fontSize: 14.sp) ,)),
                          Image.asset(AppImage.check,height: 16.r,width: 16.r,),Text(" ${list.experts?.sebiRegNo}",style: context.subTitleStyle.copyWith(fontSize: 10),)
                        ],
                      ),
                      Text(list.experts?.name??"",style:context.smallTxtStyle.copyWith(fontSize: 10.sp,color: Color(0xff9C9C9C)) ,),


                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          SizedBox(
            height: 105.h,
            width: double.infinity,
            child: MediaQuery.removePadding(
              removeLeft: true,removeTop: true,
              context: context,
              child: PageView(
                reverse: false,
                controller: controller,
                children:List.generate(5, (index) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 15.w),
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.white.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1D242D).withOpacity(0.4),
                              Color(0xff1D242D).withOpacity(0.1),
                            ])
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(DateFormat("hh:mm a").format(list.createdOn??DateTime.now()),style: context.smallTxtStyle.copyWith(color: Color(0xffC6CDD5),height: 1),)),
                        Text(list.planType??"",style:context.titleStyle.copyWith(fontSize: 14.sp),),
                        SizedBox(height: 8.h,),
                        Row(
                          children: [
                            Text("Amount :",style: context.smallTxtStyle.copyWith(color: Color(0xffC6CDD5)),),
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 3.h),
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white.withOpacity(0.1)
                              ),
                              child: Text('\u{20B9}${list.amount}',style:context.titleStyle.copyWith(fontSize: 12),),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Flexible(child: Text("Duration :",style: context.smallTxtStyle.copyWith(color: Color(0xffC6CDD5)),)),
                            Text("  ${list.durationMonth} month",style:context.titleStyle.copyWith(fontSize: 12,fontWeight: FontWeight.w600)),
                            SizedBox(width: 20.w,),
                            Flexible(child: Text("Discount :",style: context.smallTxtStyle.copyWith(color: Color(0xffC6CDD5)),)),
                            Text(context.read<CopartnerCubit>().getPercentage(list.amount!.toDouble(), list.discountedAmount!.toDouble())+"%",style:context.titleStyle.copyWith(fontSize: 12,fontWeight: FontWeight.w600))
                          ],
                        ),

                      ],
                    ),
                  );
                },),
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: controller,  // PageController
              count:  5,
              effect:  ExpandingDotsEffect(
                  dotHeight: 5.h,
                  dotWidth: 10.w,
                  activeDotColor: Colors.white
              ),  // your preferred effect

            ),
          )
        ],
      ),
    );;
  }

}
