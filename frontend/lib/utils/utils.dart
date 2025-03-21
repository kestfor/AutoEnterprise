import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notifications/notification.dart';
import "package:grpc/grpc.dart" as grpc;

String formatType(String type) {
  return type.replaceAll("_", " ");
}

String reverseFormatType(String type) {
  return type.replaceAll(" ", "_");
}

String getDate(DateTime date) {
  String formattedDate = DateFormat('dd MMMM yyyy').format(date);
  return formattedDate;
}

String getTime(DateTime date) {
  String formattedTime = DateFormat('HH:mm').format(date);
  return formattedTime;
}

String getDateTime(DateTime date) {
  String formattedDate = DateFormat('dd MMMM yyyy HH:mm').format(date);
  return formattedDate;
}


String getFormatedDate(DateTime date) {
  return getDate(date);
}

String getFormatedDateTime(DateTime date) {
  return getDateTime(date);
}

Future<bool> saveChangesWrapper(context, Function saveChanges) async {
  try {
    await saveChanges();
    showSuccess(context, "Changes saved");
    return true;
  } on grpc.GrpcError catch (e) {
    showError(context, e.toString());
  } catch (e) {
    showError(context, "unexpected error");
  }
  return false;
}

Widget saveButton(Function onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.green, // Цвет темы для кнопки
        foregroundColor: Colors.white, // Цвет текста на кнопке
      ),
      child: const Text(
        "Save Changes",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}