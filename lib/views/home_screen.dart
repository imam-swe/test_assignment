
import 'package:akij_assignment/configs/sizes.dart';
import 'package:akij_assignment/views/geo_punch/geo_punch.dart';
import 'package:akij_assignment/views/order_submit/order_submit.dart';
import 'package:akij_assignment/views/qr_code/qr_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        await showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('Dismiss'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Exit',
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          // iconTheme: const IconThemeData(color: AppColors.whiteColor),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.height(context) * 0.01),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.height(context) * 0.01, bottom: AppSizes.height(context) * 0.03),
                    child: Card(
                      child: GestureDetector(
                        onTap: () {                                     
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScanScreen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width(context) * 0.01,
                            vertical: AppSizes.width(context) * 0.01,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/qrcode.png', height: AppSizes.height(context) * 0.05, width: AppSizes.height(context) * 0.05, fit: BoxFit.cover),
                              Text('QR Code Scanner', style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.height(context) * 0.01, bottom: AppSizes.height(context) * 0.03),
                    child: Card(
                      child: GestureDetector(
                        onTap: () {                                     
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const GeoPunchSubmitWidget()));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width(context) * 0.01,
                            vertical: AppSizes.width(context) * 0.01,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/geopunch.png', height: AppSizes.height(context) * 0.05, width: AppSizes.height(context) * 0.05, fit: BoxFit.cover),
                              Text('Geo Punch', style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.height(context) * 0.01, bottom: AppSizes.height(context) * 0.03),
                    child: Card(
                      child: GestureDetector(
                        onTap: () {                                     
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderSubmitScreen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width(context) * 0.01,
                            vertical: AppSizes.width(context) * 0.01,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/order.png', height: AppSizes.height(context) * 0.05, width: AppSizes.height(context) * 0.05, fit: BoxFit.cover),
                              Text('Submit Order', style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}