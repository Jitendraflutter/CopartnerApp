import 'package:assignment/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CopartnerShimmer extends StatelessWidget {
  const CopartnerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.white.withOpacity(0.5),
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (_, index) {
          return _buildListItem(context);
        }, separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 20.h,),)
    );

  }
}
_buildListItem(BuildContext context)
{
  
  return Container(
    // duration:Duration(
    //   milliseconds: 500
    // ),

    height: 190.h,
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
                backgroundColor: Colors.grey,
                  ),
              SizedBox(width: 10.h,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 18,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),

                        ),
                       Spacer(),
                       CircleAvatar(
                         radius: 10,
                         backgroundColor: Colors.grey,
                       ),
                        Container(
                          width: 40,
                          height: 20,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 6,),
                    Container(
                      width: 70,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                      ),

                    )
                    //Text(,style:context.smallTxtStyle.copyWith(fontSize: 10.sp,color: Color(0xff9C9C9C)) ,),


                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15.h,),
        SizedBox(
          height: 100.h,
          width: double.infinity,
          child:
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(left: 15.w,right: 15.w),
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
                    child:  Container(
                      width: 40,
                      height: 15,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),

                    )),
                Container(
                  width: 120,
                  height: 15,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
                SizedBox(height: 8.h,),
                Container(
                  width: 90,
                  height: 15,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 15,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                    SizedBox(width: 20.w,),
                    Container(
                      width: 90,
                      height: 15,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                  ],
                ),

              ],
            ),
          )
        ),
        SizedBox(height: 15.h,),
        Align(
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            count:  5,
            effect:  ExpandingDotsEffect(
                dotHeight: 5.h,
                dotWidth: 10.w,
                activeDotColor: Colors.white
            ), controller: PageController(),  // your preferred effect

          ),
        )
      ],
    ),
  );
}