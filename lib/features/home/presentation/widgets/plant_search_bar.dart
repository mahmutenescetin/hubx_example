import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';

class PlantSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PlantSearchBar({super.key, this.controller, this.onChanged});

  @override
  State<PlantSearchBar> createState() => _PlantSearchBarState();
}

class _PlantSearchBarState extends State<PlantSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        style: context.textStyles.b15Regular400.copyWith(
          color: context.colors.appColors.inputColor,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 26),
          hintText: context.l10n.searchForPlants,
          hintStyle: context.textStyles.b15Regular400.copyWith(
            color: context.colors.appColors.inputColor,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }
}
