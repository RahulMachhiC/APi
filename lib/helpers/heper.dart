import 'package:flutter/material.dart';

class Helper {
  BuildContext context;
  Helper.of(BuildContext _context) {
    this.context = _context;
  }
  static getData(Map<String, dynamic> data) {
    return data[0] ?? [];
  }
}
