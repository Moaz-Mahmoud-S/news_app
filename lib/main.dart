import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/cubit/bloc_observer.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

import 'layout/news_app/news_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
  runApp(MyApp(CacheHelper.getdata("isDark")));
}

// MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       darkTheme: ThemeData
//         (
//         primarySwatch: Colors.deepOrange,
//         scaffoldBackgroundColor: HexColor('#FF083663'),
//         appBarTheme: AppBarTheme(
//             backgroundColor: Colors.white,
//             elevation: 0.0,
//             titleTextStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//             iconTheme: IconThemeData(color: Colors.black)),
//           bottomNavigationBarTheme: BottomNavigationBarThemeData(
//               type: BottomNavigationBarType.fixed,
//               selectedItemColor: Colors.black),
//           textTheme: TextTheme
//             (
//               bodyText1:
//               TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white)
//           )
//       ),
//       themeMode: ThemeMode.dark,
//       theme: ThemeData(
//           appBarTheme: AppBarTheme(
//               backgroundColor: Colors.white,
//               elevation: 0.0,
//               titleTextStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               iconTheme: IconThemeData(color: Colors.black)),
//           bottomNavigationBarTheme: BottomNavigationBarThemeData(
//               type: BottomNavigationBarType.fixed,
//               selectedItemColor: Colors.deepOrange),
//         textTheme: TextTheme
//           (
//           bodyText1:
//           TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black)
//         )
//       ),
//       title: 'Flutter Demo',
//       home: News_layout(),
//     )
class MyApp extends StatelessWidget {
  bool ? isDark=false;
  // This widget is the root of your application.
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsAppCubit()..getBusiness(),),
        BlocProvider(create: (context) => NewsAppCubit()..changemode(fromshared: isDark),),
      ],
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, NewsAppStates state) {},
        builder: (context, NewsAppStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.blueGrey,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.blueGrey,
                    elevation: 10.0,
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    iconTheme: IconThemeData(color: Colors.white)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.blueGrey,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange[400]),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    iconTheme: IconThemeData(color: Colors.black)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
            title: 'Flutter Demo',
            themeMode:NewsAppCubit.getobject(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: News_layout(),
          );
        },
      ),
    );
  }
}
