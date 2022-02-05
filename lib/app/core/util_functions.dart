import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:readgear/app/core/crash_analytics.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

class PhoneNumberUtils {
  static bool phoneNumberValidate(String phoneNumber, int length) {
    return phoneNumber.length == length;
  }
}

Future<void> openEmail(
    {required String emailTo, required BuildContext context}) async {
  try {
    final Uri params = Uri(
      scheme: 'mailto',
      path: emailTo,
      // query: 'subject=""&body=""', //add subject and body here
    );

    var url = params.toString();
    await canLaunch(url) ? await launch(url) : throw 'Could not launch Email';
  } catch (e) {
    Clipboard.setData(ClipboardData(text: emailTo)).then((value) {
      // customSnackBar(
      //     subtitle: "Seems like no app available! Copied to clipboard");
    });
  }
}

String? getFileType(String path) {
  return lookupMimeType(path);
}

onSaveImageFromUrl(String filename, String imageUrl) async {
  try {
    EasyLoading.showToast("Saving Image .....");
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: filename,
    );
    EasyLoading.showSuccess("Image Downloaded");
  } catch (exception, stackTrace) {}
}

Future<void> openPhone(
    {required String phoneNumber, required BuildContext context}) async {
  try {
    var url = "tel:+$phoneNumber";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Call';
    }
  } catch (e) {
    Clipboard.setData(ClipboardData(text: phoneNumber)).then((value) {
      // customSnackBar(
      //     subtitle: "Seems like no app available! Copied to clipboard");
    });
  }
}

Future pickFile({
  bool? allowMultiple = false,
  List<String>? compatibleExtension = const [
    'jpg',
    "jpeg",
    "png",
    'pdf',
    'doc',
  ],
  FileType fileType = FileType.custom,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: allowMultiple!,
    // allowedExtensions: compatibleExtension,
  );

  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  } else {
    // User canceled the picker
    return null;
  }
}

Future pickImage({required bool fromCamera}) async {
  final ImagePicker _picker = ImagePicker();
  // Capture a photo
  final XFile? photo = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery);
  if (photo != null) {
    File file = File(photo.path);
    return file;
  } else {
    // User canceled the picker
    return null;
  }
}

Future shareExternally({String? imgLink, String? text}) async {
  if (imgLink != null) {
    final url = Uri.parse(imgLink);
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path], text: text);
  } else {
    await Share.share(text ?? "No message is there");
  }
}

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 100, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month, kToday.day);
final dateFormatter = DateFormat('dd-mm-yyyy');

String getAmountString(double ammount) {
  if (ammount == null) {
    ammount = 0.0;
  }
  var num1 = num.parse(ammount.toStringAsFixed(2));
  return "\u{20B9} $num1";
}
