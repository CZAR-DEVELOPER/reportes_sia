import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String? emptyText;
  final bool? isExpanded;
  final List<Widget>? actions;
  final List<Widget> items;
  final Widget? bottom;

  const CustomBottomSheet(
      {Key? key,
      required this.title,
      this.actions = const [],
      required this.items,
      this.emptyText,
      this.isExpanded = true,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Container(
      child: Column(
        mainAxisSize: isExpanded == true ? MainAxisSize.max : MainAxisSize.min,
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: appTheme.textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: actions!,
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          isExpanded == true
              ? Expanded(
                  child: items.isNotEmpty
                      ? ListView(
                          children: items,
                        )
                      : Center(
                          child: Opacity(
                              opacity: .5,
                              child: Text(emptyText ?? 'Empty list')),
                        ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: items,
                ),
          bottom != null ? const Divider() : Container(),
          SizedBox(
            width: double.infinity,
            child: bottom,
          )
        ],
      ),
    );
  }
}
