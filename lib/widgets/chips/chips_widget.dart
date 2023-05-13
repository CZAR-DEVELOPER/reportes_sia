import 'package:flutter/material.dart';

class CustomSelectChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Function(bool)? onSelect;

  const CustomSelectChip(
      {Key? key, required this.label, required this.selected, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return ChoiceChip(
      selectedShadowColor: appTheme.colorScheme.primary,
      elevation: 0,
      side: BorderSide(
          width: .5,
          color: selected == false
              ? appTheme.colorScheme.onBackground.withOpacity(.5)
              : Colors.transparent),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32), side: const BorderSide()),
      disabledColor: appTheme.colorScheme.secondary.withOpacity(.5),
      backgroundColor: Colors.transparent,
      selected: selected,
      // selectedColor: appTheme.colorScheme.primary,
      label: Text(
        label,
        style: selected == true
            ? appTheme.textTheme.bodyMedium!.copyWith(
                color: appTheme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold)
            : appTheme.textTheme.bodyMedium!
                .copyWith(color: appTheme.colorScheme.onBackground),
      ),
      onSelected: onSelect,
    );
  }
}
