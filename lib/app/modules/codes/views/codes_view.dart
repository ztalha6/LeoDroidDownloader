import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/codes_controller.dart';

class CodesView extends GetView<CodesController> {
  const CodesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<CodesController>(builder: (model) {
      return Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments['isPlus'] ? 'Droid Plus' : 'Codes'),
          centerTitle: true,
        ),
        body: model.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator.adaptive())
            : GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemCount: model.appList.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Spacer(),
                            Image.network(model.appList[i].acf!.icon!),
                            // const Icon(
                            //   Icons.facebook,
                            //   size: 70,
                            //   color: Colors.blue,
                            // ),
                            const Spacer(),
                            Text(
                              model.appList[i].title!.rendered!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await model.urlLaunch(i);
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Theme.of(context).primaryColor,
                                // Background Color
                              ),
                              child: Text(
                                Get.arguments['isPlus']
                                    ? 'Download'
                                    : 'View Code',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisExtent: 190,
                ),
              ),
      );
    });
  }
}
