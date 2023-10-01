import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget showShimmer({required Widget child}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade700,
    highlightColor: Colors.grey.shade200,
    child: child,
  );
}
