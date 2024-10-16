import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String title;
  final Widget icon;
  VoidCallback? onPressed;

  CircleButton({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              width: 80,
              height: 80,
              decoration: const ShapeDecoration(
                color: Color(0xFF424C71),
                shape: OvalBorder(),
              ),
              child: Center(
                child: icon,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
