import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/module/search/search_screen.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class News_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (BuildContext context, NewsAppStates states) {},
      builder: (BuildContext context, NewsAppStates states) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                NewsAppCubit.getobject(context)
                    .appbar[NewsAppCubit.getobject(context).index],
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) { return SearchScreen();}));
              }, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    return NewsAppCubit.getobject(context).changemode();
                  },
                  icon: Icon(Icons.brightness_6_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: "business"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: "science"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "sports"),

            ],
            currentIndex: NewsAppCubit.getobject(context).index,
            onTap: (index) {
              NewsAppCubit.getobject(context).AppBarState(index);
            },
          ),
          body: NewsAppCubit.getobject(context)
              .L1[NewsAppCubit.getobject(context).index],
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            onPressed: () { },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
