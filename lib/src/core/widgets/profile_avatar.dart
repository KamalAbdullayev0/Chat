import 'package:chat/src/core/constants/color.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback? onTap;

  const ProfileAvatar({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.fgrey,
          child: Icon(
            Icons.person,
            size: 50,
            color: Colors.black54,
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: onTap, // Handles the tap event
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
