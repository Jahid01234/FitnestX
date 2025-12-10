
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color:Theme.of(context).brightness == Brightness.dark
                ? Colors.grey
                : Colors.transparent,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: globalTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: globalTextStyle(
                fontSize: 14,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white54
                    : Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    "Cancel",
                    style: globalTextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: onConfirm,
                  child: Text(
                    "Delete",
                    style: globalTextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}