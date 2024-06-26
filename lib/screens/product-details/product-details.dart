// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/payment_screen/Payment_main/payment.dart';
import 'package:weddify/screens/cart_screen/cart_screen.dart';
import 'package:weddify/screens/checkout_screens/checkout_screen.dart';

class ProductsDeatials extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductsDeatials({super.key, required this.singleProduct});

  @override
  State<ProductsDeatials> createState() => _ProductsDeatialsState();
}

class _ProductsDeatialsState extends State<ProductsDeatials> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // title: Text(
        //   widget.singleProduct.name,
        //   style: TextStyle(color: Colors.black),
        // ),
        backgroundColor: Colors.blue.shade100,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        //iconTheme: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(widget: CartScreen(), context: context);
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 300,
                  width: 350,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12
                      // topLeft: Radius.circular(5),
                      // bottomRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.singleProduct.image.toString(),
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: GoogleFonts.kurale(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(
                        () {
                          widget.singleProduct.isFavourite =
                              !widget.singleProduct.isFavourite;
                        },
                      );
                      if (widget.singleProduct.isFavourite) {
                        appProvider.addFavouriteProduct(widget.singleProduct);
                      } else {
                        appProvider
                            .removeFavouriteProduct(widget.singleProduct);
                      }
                    },
                    icon: Icon(
                      appProvider.getFavouriteProductList
                              .contains(widget.singleProduct)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
              Text(
                widget.singleProduct.description,
                style: GoogleFonts.kurale(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        if (qty >= 2) {
                          qty--;
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.pink[400],
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    qty.toString(),
                    style: GoogleFonts.kurale(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.pink[400],
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer(),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        ProductModel productModel =
                            widget.singleProduct.copyWith(qty: qty);
                        appProvider.addCartProduct(productModel);
                        toastMessage("Item Added");
                      },
                      child: Text(
                        "Add To Cart",
                        style: GoogleFonts.kurale(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          ProductModel productModel =
                              widget.singleProduct.copyWith(qty: qty);
                          Routes.instance.push(
                              widget: PaymentMethod(
                                singleProduct: productModel,
                              ),
                              context: context);
                        },
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.kurale(
                            fontSize: 15,
                          ),
                        ),
                      )),
                ],
              ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
