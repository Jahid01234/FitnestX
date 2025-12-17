import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String image;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileTile({
    super.key,
    required this.image,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Image.asset(image,height: 20,width: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: globalTextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing ??
                const Icon(Icons.arrow_forward_ios,
                    size: 18, color: Colors.black38,
                ),
          ],
        ),
      ),
    );
  }
}
