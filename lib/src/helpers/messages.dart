import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final class Messages {
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.error(message: message));
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  static void showSucess(String message, BuildContext context) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.success(message: message));
  }
}

mixin MessageStateMixin {
  final Signal<String?> _errorMenssage = signal(null);
  String? get errorMenssage => _errorMenssage();

  final Signal<String?> _infoMenssage = signal(null);
  String? get infoMenssage => _infoMenssage();

  final Signal<String?> _sucessMenssage = signal(null);
  String? get sucessMenssage => _sucessMenssage();

  void clearError() => _errorMenssage.value = null;
  void clearInfo() => _infoMenssage.value = null;
  void clearSucess() => _sucessMenssage.value = null;

  void showError(String message) {
    untracked(() => clearError()); //não notifica os usuarios externos
    _errorMenssage.value = message; //notifica os usarios externos
  }

  void showInfo(String message) {
    untracked(() => clearInfo()); //não notifica os usuarios externos
    _infoMenssage.value = message; //notifica os usarios externos
  }

  void showSucess(String message) {
    untracked(() => clearSucess()); //não notifica os usuarios externos
    _sucessMenssage.value = message; //notifica os usarios externos
  }

  void clearAllMessages() {
    untracked(() {
      clearError();
      clearInfo();
      clearSucess();
    });
  }
}

mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  //escutando as alteraçoes de estado
  void messageListener(MessageStateMixin state) {
    switch (state) {
      case MessageStateMixin(:final errorMenssage?):
        Messages.showError(errorMenssage, context);
      case MessageStateMixin(:final infoMenssage?):
        Messages.showInfo(infoMenssage, context);
      case MessageStateMixin(:final sucessMenssage?):
        Messages.showError(sucessMenssage, context);
    }
  }
}
