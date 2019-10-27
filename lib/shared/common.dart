import 'package:flutter/material.dart';


route(BuildContext context,  Widget page){
  return Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => page)
  );
}

routeReplace(BuildContext context,  Widget page){
  return Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => page)
  );
}