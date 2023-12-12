
import 'package:akij_assignment/configs/sizes.dart';
import 'package:akij_assignment/models/homescreen_button_model.dart';
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
                    child: GridView.builder(
                      itemCount: Users().lists.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.width(context) * 0.005, vertical: AppSizes.height(context) * 0.01),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: AppSizes.height(context) * 0.12,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        crossAxisCount: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var data = Users().lists[index];
                        return Card(
                          child: GestureDetector(
                            onTap: () {                                     
                              data.id == 'qr_code' ? Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScanScreen()))
                                  : data.id == 'geo_punch' ? null
                                      : null;
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
                                  Image.asset(data.icon, height: AppSizes.height(context) * 0.05, width: AppSizes.height(context) * 0.05, fit: BoxFit.cover),
                                  Text('${data.name}', style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // const Divider(
                  //     color: AppColors.primaryColor, thickness: 0.5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}