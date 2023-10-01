import 'package:flutter/material.dart';
import 'package:submission1/components/shimmers.dart';

Widget customCard({
  required Widget leading,
  required Widget title,
  required Widget subtitle,
  Widget? trailing,
  required VoidCallback onClick,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.shade900,
        onTap: onClick,
        child: ListTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing ?? const SizedBox(),
        ),
      ),
    ),
  );
}

Widget customElevatedButton({
  required Widget content,
  required VoidCallback onClick,
  Color bgColor = Colors.blue,
}) {
  return ElevatedButton(
    onPressed: onClick,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: bgColor,
    ),
    child: content,
  );
}

Widget customOutlinedButton({
  required Widget content,
  required VoidCallback onClick,
  required Color bgColor,
  required Color outlineColor,
}) {
  return OutlinedButton(
    onPressed: onClick,
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(
          color: outlineColor,
          width: 1,
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(bgColor),
    ),
    child: content,
  );
}

enum CustomShapeImg { circle, rectangle }

Widget customImageNetwork(
    {required String imgUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    BorderRadius? borderRadius,
    CustomShapeImg shape = CustomShapeImg.rectangle}) {
  switch (shape) {
    case CustomShapeImg.rectangle:
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.network(
          imgUrl,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, widget, progress) {
            if (progress == null) return widget;
            return showShimmer(
              child: Container(
                width: width,
                height: height,
                color: Colors.grey,
              ),
            );
          },
          errorBuilder: (context, widget, progress) {
            return Image.asset(
              "assets/img-placeholder.jpg",
              width: width,
              height: height,
            );
          },
        ),
      );
    case CustomShapeImg.circle:
      return CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
          imgUrl,
        ),
      );
  }
}

Widget explicitLabel({required BuildContext context}) {
  return Container(
    color: Colors.white60,
    margin: const EdgeInsets.only(left: 5, right: 3),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        "E",
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
    ),
  );
}
