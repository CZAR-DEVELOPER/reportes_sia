import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final TextAlign? textAlign;
  final String titleString;
  const TextDisplay(this.titleString, {Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titleString, textAlign: textAlign, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w300));
  }
}

class TextSubdisplay extends StatelessWidget {
  final TextAlign? textAlign;
  final String titleString;
  const TextSubdisplay(this.titleString, {Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titleString, textAlign: textAlign, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w300));
  }
}

class TextTitle extends StatelessWidget {
  final TextAlign? textAlign;
  final String titleString;
  const TextTitle(this.titleString, {Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titleString, textAlign: textAlign, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.normal));
  }
}

class TextSubtitle extends StatelessWidget {
  final TextAlign? textAlign;

  final String sectionTitleString;
  const TextSubtitle(this.sectionTitleString, {Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(sectionTitleString, textAlign: textAlign, style: Theme.of(context).textTheme.titleLarge);
  }
}

class TextSection extends StatelessWidget {
  final String sectionTitleString;
  const TextSection(this.sectionTitleString, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionTitleString,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}

class TextBody extends StatelessWidget {
  final String sectionTitleString;
  const TextBody(this.sectionTitleString, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionTitleString,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
    );
  }
}
