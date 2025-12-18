import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/model/equipment_model.dart';
import 'package:flutter/material.dart';

class EquipmentCard extends StatelessWidget {
  final EquipmentModel equipmentModel;

  const EquipmentCard({
    super.key,
    required this.equipmentModel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
                equipmentModel.image,
                height: 30,
                width: 30,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 120,
          child: Text(
            equipmentModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: globalTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}