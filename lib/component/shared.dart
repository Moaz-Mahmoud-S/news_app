
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/module/web_view/web_view_screen.dart';

Widget buildnewsitem(list,context) {
  return InkWell(

    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage('${list['urlToImage']}'), fit: BoxFit.cover),
              )),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
                height: 120,
                child: Column(

                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          '${list["title"]}',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    Text(
                      '${list["publishedAt"]}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )),
          )
        ],
      ),
    ),
    onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) { return WebViewScreen(list['url']);}));
    },
  );
}
Widget buildformtextfield (
    {
      required TextEditingController controller,
      required Function validatorfunction,
      required TextInputType T1,
      required String labeltext,
      required Icon c1,}
    )
{
  return  TextFormField(
    controller: controller,
    obscureText: true,
    validator: validatorfunction(),
    keyboardType: T1,
    decoration: InputDecoration
      (
      labelText: labeltext,
      prefixIcon: c1,
      border: OutlineInputBorder(),
    ),
  );
}
