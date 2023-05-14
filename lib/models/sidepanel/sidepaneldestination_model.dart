// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class SidePanelDestination {
  String label;
  String route;
  IconData icon;
  SidePanelDestination({
    required this.label,
    required this.route,
    required this.icon,
  });

  SidePanelDestination copyWith({
    String? label,
    String? route,
    IconData? icon,
  }) {
    return SidePanelDestination(
      label: label ?? this.label,
      route: route ?? this.route,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'route': route,
      'icon': icon.codePoint,
    };
  }

  factory SidePanelDestination.fromMap(Map<String, dynamic> map) {
    return SidePanelDestination(
      label: map['label'] as String,
      route: map['route'] as String,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory SidePanelDestination.fromJson(String source) =>
      SidePanelDestination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SidePanelDestination(label: $label, route: $route, icon: $icon)';

  @override
  bool operator ==(covariant SidePanelDestination other) {
    if (identical(this, other)) return true;

    return other.label == label && other.route == route && other.icon == icon;
  }

  @override
  int get hashCode => label.hashCode ^ route.hashCode ^ icon.hashCode;
}
