import 'package:flutter/material.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';

class MenuItem extends StatefulWidget {
  MenuItem({super.key, required this.title, this.isActive = false});

  final String title;
  bool isActive;
  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: widget.isActive ? const Color(0xFFEFE7F9) : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: widget.isActive
              ? const BorderSide(width: 1, color: Color(0xFFBC9BE6))
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration:
                              const BoxDecoration(color: Color(0xFFD9D9D9)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: widget.isActive
                            ? const Color(0xFF5B0BC1)
                            : greyColor2,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
