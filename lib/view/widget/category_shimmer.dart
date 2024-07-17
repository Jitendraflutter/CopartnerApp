import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.white.withOpacity(0.5),
         child: Container(
           width: 60.w,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(left: 12.r,right: 10.r,top: 13.r,bottom: 13.r),
          decoration: BoxDecoration(
              color: Color(0xff0081F1),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(width: 0.76,color:Colors.white.withOpacity(0.30))
           ),
         ),
    );
   
  }
}
