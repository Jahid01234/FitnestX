import 'package:fitnestx/core/const/icons_path.dart';
import 'package:flutter/material.dart';

class SearchFilterSection extends StatelessWidget {
  const SearchFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ]
        ),
        child: Row(
          children: [
            // Search TextField
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search......",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      IconsPath.search,
                      height: 10,
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 30,
              width: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(IconsPath.filter, height: 30),
            ),
          ],
        ),
      ),
    );
  }
}
