import 'package:tasks/backend/index.dart';

export 'dart:async';
export 'dart:io';
export 'dart:developer';

export 'package:flutter/services.dart';
export 'package:get/get.dart' hide HeaderValue;
export 'package:google_fonts/google_fonts.dart';
export 'package:hive/hive.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:image_picker/image_picker.dart';
export 'package:share_plus/share_plus.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter_svg/flutter_svg.dart';

export './backend/index.dart';
export './frontend/index.dart';
export './widgets/index.dart';

Api api = Api.instance;
