import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:newsapp/component/shared.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsAppCubit , NewsAppStates>(
      listener: (BuildContext context,NewsAppStates state){},
      builder: (BuildContext context,NewsAppStates state){return Conditional.single(
          context: context,
          conditionBuilder: (BuildContext context) => NewsAppCubit.business.length>0,
          widgetBuilder: (BuildContext context){ return
            ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context,int index){return buildnewsitem(NewsAppCubit.business[index],context);}, separatorBuilder: (BuildContext context,int index){return Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(height: 1,color: Colors.grey,),
                );}, itemCount: NewsAppCubit.business.length);},
          fallbackBuilder: (BuildContext context){ return Center(child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ));}
      );},
    );}
}
