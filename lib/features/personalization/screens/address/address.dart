import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/widgets/appbar/appbar.dart';
import 'package:prayroz/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:prayroz/features/personalization/screens/address/widgets/single_address.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart'; // Ensure you're using GetX

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
          children: [
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: true),
          ],
        ),),
      )
    );
  }
}


