import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

import '../../themes/our_colors.dart';
import '../text/text_view.dart';

class Announcement {
  factory Announcement() => _instance;

  Announcement._internal();

  static final Announcement _instance = Announcement._internal();

  final double viewWidth = 320;
  final Duration duration = const Duration(seconds: 7);

  // Info
  void showAnnouncement(BuildContext context, String title, String message) {
    ElegantNotification.info(
      title: Text(title, style: TypographyType.labelModerate.value),
      description: Text(message, style: TypographyType.bodyModerate.value),
      width: viewWidth,
      background: ComponentColors.background.notificationCard,
      autoDismiss: false,
      animation: AnimationType.fromBottom,
      notificationPosition: NotificationPosition.bottomCenter,
      showProgressIndicator: false,
      toastDuration: duration,
    ).show(context);
  }

  // Error
  void showError(BuildContext context, String title, String message) {
    ElegantNotification.error(
      title: Text(title, style: TypographyType.labelModerate.value),
      description: Text(message, style: TypographyType.bodyModerate.value),
      width: viewWidth,
      background: ComponentColors.background.notificationCard,
      autoDismiss: false,
      animation: AnimationType.fromBottom,
      notificationPosition: NotificationPosition.bottomCenter,
      showProgressIndicator: false,
      toastDuration: duration,
    ).show(context);
  }

  // Success
  void showSuccess(BuildContext context, String title, String message) {
    ElegantNotification.success(
      title: Text(title, style: TypographyType.labelModerate.value),
      description: Text(message, style: TypographyType.bodyModerate.value),
      width: viewWidth,
      background: ComponentColors.background.notificationCard,
      animation: AnimationType.fromBottom,
      notificationPosition: NotificationPosition.bottomCenter,
      showProgressIndicator: false,
      autoDismiss: false,
      toastDuration: duration,
    ).show(context);
  }
}
