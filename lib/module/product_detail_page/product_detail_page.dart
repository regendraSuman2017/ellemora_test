import 'package:almora_test/module/product_detail_page/product_detail_controller.dart';
import 'package:almora_test/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ResponsiveLayout(
      mobileBody: myMobileBody(context),
      tabletBody: myTabletBody(context),
      desktopBody: myDesktopBody(context),
    );

    /* return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Obx(()=>controller.isLoading.value? Center(child: CircularProgressIndicator(),): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                   height: ResponsiveLayout.isSmallScreen(context)
            ? Get.width*0.17
            : ResponsiveLayout.isMediumScreen(context)
            ? Get.width*0.15
            : Get.width*0.2,
                  child: controller.imageUrl.isEmpty? Text("Image loading")
                      : Image.network(controller.imageUrl.value,
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? Get.width*0.17
                        : ResponsiveLayout.isMediumScreen(context)
                        ? Get.width*0.15
                        : Get.width*0.2,fit: BoxFit.fill,)),
            SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: Get.width*0.5,
                child:
          Text(controller.title.toString(),
            style: TextStyle(
                color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
            maxLines: 2,)),
          Text(controller.price.toString(),style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),),
          ]),
SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),
          Text(controller.description.toString(), style: TextStyle(

              fontSize: 14,
              fontWeight: FontWeight.w500
          ),),

            ],
          ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(controller.cartItem.contains(controller.id)) {

                    }else{
                      controller.cartItem.add({
                        "id": controller.id,
                        'title': controller.title,
                      });
                    }

                  },
                  child: Text('Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.cartItem.contains(controller.id)) {

                    }else{
                      controller.cartItem.add({
                        "id": controller.id,
                        'title': controller.title,
                      });
                    }

                  },
                  child: Text('Add to Cart'),
                ),
              ],
            )
          ],
        ),
      ),
      )
    );*/
  }
  myMobileBody(context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Obx(()=>controller.isLoading.value? const Center(child: CircularProgressIndicator(),):
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              controller.imageUrl.isEmpty? const Text("Image loading")
                  : Image.network(controller.imageUrl.value,
                width: ResponsiveLayout.isSmallScreen(context)
                    ? Get.width*0.55
                    : ResponsiveLayout.isMediumScreen(context)
                    ? Get.width*0.15
                    : Get.width*0.3,

                height: ResponsiveLayout.isSmallScreen(context)
                    ? Get.width*0.55
                    : ResponsiveLayout.isMediumScreen(context)
                    ? Get.width*0.15
                    : Get.width*0.3,

                fit: BoxFit.fill,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.title.toString(),
                style:  TextStyle(
                  fontSize:  ResponsiveLayout.isSmallScreen(context)
                      ? Get.width*0.06
                      : ResponsiveLayout.isMediumScreen(context)
                      ? Get.width*0.03
                      : Get.width*0.022,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,),
              const SizedBox(height: 10,),
              Text('\u{20B9} '+controller.price.toString(),
                style:  TextStyle(
                  fontSize:  ResponsiveLayout.isSmallScreen(context)
                      ? Get.width*0.055
                      : ResponsiveLayout.isMediumScreen(context)
                      ? Get.width*0.03
                      : Get.width*0.015,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description",
                    style:  TextStyle(
                        fontSize:  ResponsiveLayout.isSmallScreen(context)
                            ? Get.width*0.055
                            : ResponsiveLayout.isMediumScreen(context)
                            ? Get.width*0.03
                            : Get.width*0.016,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 5,),

                  Text(controller.description.toString(),
                    style:  TextStyle(
                      fontSize:  ResponsiveLayout.isSmallScreen(context)
                          ? Get.width*0.04
                          : ResponsiveLayout.isMediumScreen(context)
                          ? Get.width*0.03
                          : Get.width*0.014,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                ],
              ),
              const SizedBox(height: 20,),
            ],
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your onPressed code here!
                      print('Item added to cart');
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text(
                      'Add to Cart',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:ResponsiveLayout.isSmallScreen(context)
                            ? Get.width*0.045
                            : ResponsiveLayout.isMediumScreen(context)
                            ? Get.width*0.035
                            : Get.width*0.021,),

                      overflow: TextOverflow.ellipsis,
                    ),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue, // foreground (text) color
                        padding: EdgeInsets.symmetric(horizontal: 24,vertical: ResponsiveLayout.isSmallScreen(context)
                            ? Get.width*0.045
                            : ResponsiveLayout.isMediumScreen(context)
                            ? Get.width*0.018
                            : Get.width*0.015),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),

                  const SizedBox(width: 30,),
                  ElevatedButton(
                    child:  Text(
                      'Add to wish',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:ResponsiveLayout.isSmallScreen(context)
                            ? Get.width*0.045
                            : ResponsiveLayout.isMediumScreen(context)
                            ? Get.width*0.035
                            : Get.width*0.021,),

                      overflow: TextOverflow.ellipsis,
                    ),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent, // foreground (text) color
                        padding: EdgeInsets.symmetric(horizontal: 24,
                            vertical: ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.045
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.018
                                : Get.width*0.015),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ), onPressed: () {  },
                  ),
                ],
              ),
            ],
          ),
          ),
        )
    );
  }

  myTabletBody(context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Obx(()=>controller.isLoading.value?const Center(child: CircularProgressIndicator(),):
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: ResponsiveLayout.isSmallScreen(context)
                      ? Get.width*0.17
                      : ResponsiveLayout.isMediumScreen(context)
                      ? Get.width*0.4
                      : Get.width*0.3,
                  child: controller.imageUrl.isEmpty? const Text("Image loading")
                      : Image.network(controller.imageUrl.value,
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? Get.width*0.17
                        : ResponsiveLayout.isMediumScreen(context)
                        ? Get.width*0.4
                        : Get.width*0.3,fit: BoxFit.fill,)),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                      width: Get.width*0.5,
                      child:
                      Text(controller.title.toString(),
                        style:  TextStyle(
                          fontSize:  ResponsiveLayout.isSmallScreen(context)
                              ? Get.width*0.042
                              : ResponsiveLayout.isMediumScreen(context)
                              ? Get.width*0.03
                              : Get.width*0.022,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,)),
                  const SizedBox(height: 30,),
                  Text('\u{20B9} '+controller.price.toString(),
                    style:  TextStyle(
                      fontSize:  ResponsiveLayout.isSmallScreen(context)
                          ? Get.width*0.042
                          : ResponsiveLayout.isMediumScreen(context)
                          ? Get.width*0.03
                          : Get.width*0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",
                        style:  TextStyle(
                            fontSize:  ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.042
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.025
                                : Get.width*0.016,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 5,),

                      SizedBox(
                        width: Get.width*0.5,
                        child: Text(controller.description.toString(),
                          textAlign: TextAlign.justify,
                          style:  TextStyle(
                            fontSize: 18,
                          ),),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your onPressed code here!
                          print('Item added to cart');
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text(
                          'Add to Cart',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:18),

                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue, // foreground (text) color
                            padding: EdgeInsets.symmetric(horizontal: 24,vertical: ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.045
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.018
                                : Get.width*0.015),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),

                      const SizedBox(width: 30,),
                      ElevatedButton(
                        child:  Text(
                          'Add to wish',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:18,),

                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent, // foreground (text) color
                            padding: EdgeInsets.symmetric(horizontal: 24,
                                vertical: ResponsiveLayout.isSmallScreen(context)
                                    ? Get.width*0.045
                                    : ResponsiveLayout.isMediumScreen(context)
                                    ? Get.width*0.018
                                    : Get.width*0.015),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ), onPressed: () {  },
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
          ),
        )
    );
  }
  myDesktopBody(context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Obx(()=>controller.isLoading.value? const Center(child: CircularProgressIndicator(),):
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: ResponsiveLayout.isSmallScreen(context)
                      ? Get.width*0.17
                      : ResponsiveLayout.isMediumScreen(context)
                      ? Get.width*0.15
                      : Get.width*0.3,
                  child: controller.imageUrl.isEmpty? const Text("Image loading")
                      : Image.network(controller.imageUrl.value,
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? Get.width*0.17
                        : ResponsiveLayout.isMediumScreen(context)
                        ? Get.width*0.15
                        : Get.width*0.3,fit: BoxFit.fill,)),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                      width: Get.width*0.5,
                      child:
                      Text(controller.title.toString(),
                        style:  TextStyle(
                          fontSize:  ResponsiveLayout.isSmallScreen(context)
                              ? Get.width*0.042
                              : ResponsiveLayout.isMediumScreen(context)
                              ? Get.width*0.03
                              : Get.width*0.022,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,)),
                  const SizedBox(height: 30,),
                  Text('\u{20B9} '+controller.price.toString(),
                    style:  TextStyle(
                      fontSize:  ResponsiveLayout.isSmallScreen(context)
                          ? Get.width*0.042
                          : ResponsiveLayout.isMediumScreen(context)
                          ? Get.width*0.03
                          : Get.width*0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",
                        style:  TextStyle(
                            fontSize:  ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.042
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.03
                                : Get.width*0.018,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 5,),

                      SizedBox(
                        width: Get.width*0.5,
                        child: Text(controller.description.toString(),
                          style:  TextStyle(
                            fontSize:  ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.042
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.03
                                : Get.width*0.016,
                          ),),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your onPressed code here!
                          print('Item added to cart');
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text(
                          'Add to Cart',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.045
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.035
                                : Get.width*0.021,),

                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue, // foreground (text) color
                            padding: EdgeInsets.symmetric(horizontal: 24,vertical: ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.045
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.018
                                : Get.width*0.015),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),

                      const SizedBox(width: 30,),
                      ElevatedButton(
                        child:  Text(
                          'Add to wish',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:ResponsiveLayout.isSmallScreen(context)
                                ? Get.width*0.045
                                : ResponsiveLayout.isMediumScreen(context)
                                ? Get.width*0.035
                                : Get.width*0.021,),

                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent, // foreground (text) color
                            padding: EdgeInsets.symmetric(horizontal: 24,
                                vertical: ResponsiveLayout.isSmallScreen(context)
                                    ? Get.width*0.045
                                    : ResponsiveLayout.isMediumScreen(context)
                                    ? Get.width*0.018
                                    : Get.width*0.015),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ), onPressed: () {  },
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
          ),
        )
    );
  }
}