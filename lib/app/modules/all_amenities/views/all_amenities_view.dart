import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_amenities_controller.dart';

class AllAmenitiesView extends GetView<AllAmenitiesController> {
  const AllAmenitiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllAmenitiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllAmenitiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
