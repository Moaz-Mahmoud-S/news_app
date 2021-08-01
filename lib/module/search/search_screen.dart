import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:newsapp/component/shared.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (BuildContext context, NewsAppStates state) {},
        builder: (BuildContext context, NewsAppStates state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: false,
                    controller: control,
                    onFieldSubmitted: (String value) {
                      NewsAppCubit.getobject(context).Search(value);
                      NewsAppCubit.getobject(context).assignvalue(control,value);
                    },
               /*     onChanged: ( value) {
                      control.text=value ;
                      NewsAppCubit.getobject(context).Search(value);
                      print(value);
                     // NewsAppCubit.getobject(context).assignvalue(control,value);
                    },*/
                    validator: (String? value) {
                      if (value!.isEmpty) return "must not be empty";
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                          NewsAppCubit.search.length > 0,
                      widgetBuilder: (BuildContext context) {
                        return ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return buildnewsitem(
                                  NewsAppCubit.search[index], context);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              );
                            },
                            itemCount: NewsAppCubit.search.length);
                      },
                      fallbackBuilder: (BuildContext context) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ));
                      }),
                )
              ],
            ),
          );
        });
  }
}
