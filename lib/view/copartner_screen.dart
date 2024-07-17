
import 'dart:ui';
import 'package:assignment/core/app_image.dart';
import 'package:assignment/core/app_svg.dart';
import 'package:assignment/core/extensions.dart';
import 'package:assignment/logic/copartner_cubit.dart';
import 'package:assignment/view/widget/category_shimmer.dart';
import 'package:assignment/view/widget/copartner_card_widget.dart';
import 'package:assignment/view/widget/shimmer_coprartner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/app_string.dart';
class CopartnerScreen extends StatelessWidget {
  const CopartnerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 55.h,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace:  ClipRRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3)
              ),
            ),
          ),
        ),
        title: Row(
          children: [
          Flexible(child: Text("Jitendra",style: context.titleStyle.copyWith(fontWeight: FontWeight.w600),)),
          SizedBox(width: 5.w,),
          Text(AppString.goodDay,style: context.subTitleStyle.copyWith(fontSize: 12.sp,color: Colors.white.withOpacity(0.5)),),
          SizedBox(width: 5.w,),
          Image.asset(AppImage.hand,height: 14.r,width: 14.r,)
          ],
        ),
        actions: [
          RawMaterialButton(
            constraints: BoxConstraints(
              maxWidth: 35.r,
              maxHeight: 35.r
            ),
            onPressed: (){

              },
            child: SvgPicture.asset(AppSvg.search),
          ),
          RawMaterialButton(
            constraints: BoxConstraints(
                maxWidth: 35.r,
                maxHeight: 35.r
            ),
            onPressed: (){

             },
          child: SvgPicture.asset(AppSvg.bell,),
          ),
          RawMaterialButton(
            constraints: BoxConstraints(
                maxWidth: 35.r,
                maxHeight: 35.r
            ),
            onPressed: (){

          },
          child: CircleAvatar(
              backgroundImage:AssetImage(AppImage.profile)),
          ),
          SizedBox(width: 10.w,)
        ],
        bottom: PreferredSize(preferredSize: Size.fromHeight(35.h),
          child: Padding(
            padding:  EdgeInsets.only(left: 15.0.w,bottom: 10.h),
            child: BlocBuilder<CopartnerCubit, CopartnerState>(
               buildWhen: (previous, current) => current is LoadedState,
                builder: (context, state) {
                 if(state is LoadingState)
                   {
                     return Row(
                       children:   List.generate(3, (index) {
                         return CategoryShimmer();
                       },),
                     );
                   }
                  return Row(
                    children: [
                      _buildChipWidget(AppString.options, AppString.options==context.read<CopartnerCubit>().selectedCategory, context,(){
                        context.read<CopartnerCubit>().filterListData(AppString.options);
                      }),
                       SizedBox(
                        width: 10.w,
                      ),
                      _buildChipWidget(AppString.commodity, AppString.commodity==context.read<CopartnerCubit>().selectedCategory, context,(){
                        context.read<CopartnerCubit>().filterListData(AppString.commodity);
                      }),
                       SizedBox(
                        width: 10.w,
                      ),
                      _buildChipWidget(AppString.equity, AppString.equity==context.read<CopartnerCubit>().selectedCategory, context,(){
                        context.read<CopartnerCubit>().filterListData(AppString.equity);
                      }),
                    ],
                  );
                },
    ),
          ),
        )



      ),
        body: SizedBox(
          height: context.height,
          width: context.width,
          child: Stack(
          //  alignment: Alignment.center,
            children: [

              Positioned(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: 281.h,
                  height: 281.w,
                  child: SvgPicture.asset(AppSvg.leftTop,fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                right: 0,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 400.h,
                child: SvgPicture.asset(AppSvg.topRight,fit: BoxFit.fill,),
                ),
              ),

              Positioned(
                left: 0,
                bottom: 0,
                child: SizedBox(
                  width: 600.w,
                  height: 400.h,

                  child: SvgPicture.asset(AppSvg.leftBottomElips,fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 20.h,
                child: SizedBox(
                  width: 200.w,
                  height: 400.h,

                  child: SvgPicture.asset(AppSvg.leftBottom,fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                top: 200.h,
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: SvgPicture.asset(AppSvg.centerCardElips,fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80.0,
                    sigmaY: 80.0,
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4)
                    ),
                  ),
                ),
              ),
              Positioned(
                child: SizedBox(
                  child: SvgPicture.asset(AppSvg.border,fit: BoxFit.fill,),
                ),
              ),
    Positioned(
      top: 20.h,
      left: 20,
      right: 20,
      child: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: context.height-140.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text(AppString.subscriptions ,style: context.titleStyleRegular,),
              SizedBox(height: 10.h,),
              _buildList(context)
            ],
          ),
        ),
      ),),

            ],
          ),
        ),

    );
  }


  _buildList(BuildContext context){
    final cubit=context.read<CopartnerCubit>();
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop:true,
        child: BlocBuilder<CopartnerCubit, CopartnerState>(
  builder: (context, state) {
    if(state is LoadingState)
      {
        return CopartnerShimmer();
      }if(state is ErrorState)
      {
        return Center(child: Text(state.message,style: TextStyle(fontSize: 18,color: Colors.red),),);
      }
    return ListView.separated(
          itemCount: cubit.filterList?.length??0,
          itemBuilder: (_, index) {
          return CopartnerCardWidget(list: cubit.filterList![index],);
        }, separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 20.h,),);
  },
),
      ),
    );
  }
  _buildChipWidget(String lable,bool isSelected,BuildContext context,VoidCallback onPress){
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
          padding: EdgeInsets.only(left: 8,right: 8,top: 6,bottom: 6),
        decoration: BoxDecoration(
          color: isSelected?Color(0xff0081F1):null,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 0.76,color:isSelected?Colors.white.withOpacity(0.30): Color(0xff615E65))
        ),
          duration:const Duration(milliseconds: 500),
          child: Text(lable,style: context.titleStyle.copyWith(fontSize: 12.sp,),)),
    );
  }

}
