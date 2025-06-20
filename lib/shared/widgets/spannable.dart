import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final RegExp _splitter = RegExp(r'\%%(.*?)\%%');

class Spannable extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final VoidCallback? onTextPressed;
  final void Function(int index, String value)? onPressed;
  final TextAlign align;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final Map<String, String>? replacements;

  const Spannable(
    this.text, {
    super.key,
    this.textStyle,
    this.linkStyle,
    this.onTextPressed,
    this.onPressed,
    this.align = TextAlign.left,
    this.maxLines,
    this.decoration,
    this.overflow,
    this.replacements,
  });

  @override
  State<Spannable> createState() => _SpannableState();
}

class _SpannableValue extends Equatable {
  final String text;
  final bool isBold;

  const _SpannableValue({
    required this.text,
    required this.isBold,
  });

  @override
  List<Object> get props => [text, isBold];
}

class _SpannableState extends State<Spannable> {
  final List<GestureRecognizer> _gestureRecognizers = <GestureRecognizer>[];
  final List<_SpannableValue> values = [];
  final List<InlineSpan> elements = <InlineSpan>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (values.isEmpty) {
      _initValues();
    }
  }

  @override
  void didUpdateWidget(covariant Spannable oldWidget) {
    if (oldWidget.text != widget.text) {
      values.clear();
      elements.clear();
      _initValues();
    }

    super.didUpdateWidget(oldWidget);
  }

  void _initValues() {
    widget.text.splitMapJoin(
      _splitter,
      onMatch: (m) {
        final text = m.group(1)!;

        values.add(_SpannableValue(text: text, isBold: true));
        return text;
      },
      onNonMatch: (m) {
        values.add(_SpannableValue(text: m, isBold: false));
        return m;
      },
    );

    final trueValues = values.toList()..removeWhere((e) => !e.isBold);

    for (int i = 0; i < values.length; i++) {
      final value = values[i];

      final tapGestureRecognizer = TapGestureRecognizer();
      _gestureRecognizers.add(tapGestureRecognizer);

      final formattedText = widget.replacements?.entries.fold(
            value.text,
            (previousValue, element) =>
                previousValue.replaceAll(element.key, element.value),
          ) ??
          value.text;

      if (!value.isBold) {
        elements.add(
          TextSpan(
            text: formattedText,
            style: widget.textStyle ?? const TextStyle(color: Colors.red),
            recognizer: widget.onTextPressed != null
                ? (tapGestureRecognizer
                  ..onTap = () => widget.onTextPressed?.call())
                : null,
          ),
        );
      } else {
        elements.add(
          TextSpan(
            text: formattedText,
            style: widget.linkStyle ??
                widget.textStyle?.copyWith(
                  fontWeight: FontWeight.w700,
                ) ??
                const TextStyle(color: Colors.red),
            recognizer: widget.onPressed != null
                ? (tapGestureRecognizer
                  ..onTap = () => widget.onPressed?.call(
                        trueValues.indexOf(value),
                        value.text,
                      ))
                : null,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: elements),
      key: ValueKey(widget.text),
      textAlign: widget.align,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
    );
  }

  @override
  void dispose() {
    for (final e in _gestureRecognizers) {
      e.dispose();
    }
    super.dispose();
  }
}
