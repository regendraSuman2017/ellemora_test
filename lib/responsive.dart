import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? desktopBody;
  final Widget? mobileBody;
  final Widget? tabletBody;

  const ResponsiveLayout({Key? key,this.desktopBody,this.tabletBody,this.mobileBody}):super(key:key);

  static bool isSmallScreen(BuildContext context){
    return MediaQuery.of(context).size.width<850;
  }

  static bool isMediumScreen(BuildContext context){
    return MediaQuery.of(context).size.width>=850 && MediaQuery.of(context).size.width<=1100;
  }

  static bool isLargeScreen(BuildContext context){
    return MediaQuery.of(context).size.width>1100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth>1100){
        return desktopBody!;
      }else if(constrains.maxWidth<=1100 && constrains.maxWidth>=850){
        return tabletBody!;
      }else{
        return mobileBody??desktopBody!;
      }
    });
  }
}