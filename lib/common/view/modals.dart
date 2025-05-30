import 'package:flutter/material.dart';

import '../../extensions/taget_platform_x.dart';

Future<void> showModal({
  required BuildContext context,
  required Widget content,
  required ModalMode mode,
  bool isScrollControlled = false,
  bool enableDrag = true,
  bool? showDragHandle,
}) async {
  Widget builder(context) => content;

  switch (mode) {
    case ModalMode.bottomSheet:
      showModalBottomSheet(
        isScrollControlled: isScrollControlled,
        context: context,
        builder: builder,
        enableDrag: enableDrag,
        showDragHandle: showDragHandle,
      );

    case ModalMode.dialog:
      showDialog(context: context, builder: builder);
  }
}

enum ModalMode {
  dialog,
  bottomSheet;

  static ModalMode get platformModalMode =>
      isMobile ? ModalMode.bottomSheet : ModalMode.dialog;
}

enum OverlayMode {
  popup,
  bottomSheet;

  static OverlayMode get platformModalMode =>
      isMobile ? OverlayMode.bottomSheet : OverlayMode.popup;
}
