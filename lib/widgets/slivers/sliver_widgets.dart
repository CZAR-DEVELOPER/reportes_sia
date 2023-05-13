import 'package:flutter/material.dart';

import '../widgets.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomSliverAppBar({Key? key, required this.title, this.actions, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constrains) {
        constrains.viewportMainAxisExtent;
        return SliverAppBar(
          leading: leading,
          centerTitle: true,
          toolbarHeight: kToolbarHeight,
          pinned: true,
          title: AnimatedOpacity(
              duration: const Duration(milliseconds: 250), opacity: constrains.scrollOffset > kToolbarHeight / 2 ? 1 : 0, child: title),
          actions: actions,
        );
      },
    );
  }
}

class CustomSliverStickyBar extends StatelessWidget {
  final Widget children;
  final EdgeInsets? contentPadding;
  final double? toolbarHeight;

  const CustomSliverStickyBar({Key? key, required this.children, this.toolbarHeight = kToolbarHeight, this.contentPadding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingSize = contentPadding!.vertical;

    return SliverLayoutBuilder(
      builder: (context, constrains) {
        constrains.viewportMainAxisExtent;
        return SliverAppBar(
            titleSpacing: contentPadding!.horizontal / 2,
            automaticallyImplyLeading: false,
            toolbarHeight: toolbarHeight! + paddingSize,
            pinned: true,
            title: children);
      },
    );
  }
}

class CustomSliverList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  const CustomSliverList({
    Key? key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding!,
      sliver: SliverList(delegate: SliverChildListDelegate(children)),
    );
  }
}

class CustomSliverFillRemaining extends StatelessWidget {
  final bool? showLoading;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final EdgeInsets? padding;
  const CustomSliverFillRemaining({
    Key? key,
    this.icon,
    this.title,
    this.subtitle,
    this.showLoading = false,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Opacity(
        opacity: .5,
        child: Padding(
          padding: padding!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: Theme.of(context).textTheme.headlineLarge!.fontSize,
                ),
              if (title != null) ...[
                const SpaceY(),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
              if (subtitle != null) ...[
                const SpaceY(
                  percent: .5,
                ),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                )
              ],
              if (showLoading == true) const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

class SliverSpaceY extends StatelessWidget {
  const SliverSpaceY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SpaceY(),
    );
  }
}

class CustomSliverGrid extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final double maxCrossAxisExtent;
  final double? childAspectRatio;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  const CustomSliverGrid({
    Key? key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    required this.maxCrossAxisExtent,
    this.childAspectRatio = 1,
    this.crossAxisSpacing = 0,
    this.mainAxisSpacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding!,
      sliver: SliverGrid.extent(
        crossAxisSpacing: crossAxisSpacing!,
        mainAxisSpacing: mainAxisSpacing!,
        childAspectRatio: childAspectRatio!,
        maxCrossAxisExtent: maxCrossAxisExtent,
        children: children,
      ),
    );
  }
}

class CustomSliverStickyHeader extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;

  const CustomSliverStickyHeader({Key? key, this.padding, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        child: Container(
      padding: padding,
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    ));
  }
}
