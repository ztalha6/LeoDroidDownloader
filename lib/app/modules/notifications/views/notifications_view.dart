import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<NotificationsController>(builder: (model) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
        ),
        body: model.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator.adaptive())
            : RefreshIndicator(
                onRefresh: () async {
                  await model.onInit();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  itemCount: model.notiList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NotificationWidget(
                      title: model.notiList[index].title!.rendered!,
                      description: model.notiList[index].acf!.notificationText!,
                      readed: true,
                    );
                  },
                ),
              ),
      );
    });
  }
}

class NotificationWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool readed;

  const NotificationWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.readed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          // leading: Image.asset(
          //   readed
          //       ? notification_readed_icon_asset
          //       : notification_unreaded_icon_asset,
          //   height: readed ? 25 : 38,
          //   color: readed ? Colors.white.withOpacity(0.6) : null,
          //   colorBlendMode: BlendMode.modulate,
          // ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
                fontSize: 16, color: readed ? Colors.grey : Colors.black),
          ),
        ),
      ),
    );
  }
}
