import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:excel/excel.dart';

///Used for downloading all types of files into a single
///folder ("Downloads"), and added the decoding of excel files.
///
///From Android 6.0 Marshmallow onwards, users have to allow storage permissions before they can use the application.
///
/// Author: Lim Jun Wei
///
/// Version: 1.0.0
///
/// Since: 1 April 2021

class DiseaseDatabaseInterface {
  //list of static variables
  static String path;
  static var noPath = true;

  static Future download(String url, String filename, String fileFormat) async

  ///Downloads item
  //Parameters:
  //  url:        (string) website                 e.g."https://file-examples-com.github.io/uploads/2017/02/file_example_XLSX_10.xlsx"
  //  filename:   (string) name of file            e.g. "data"
  //  fileFormat: (string) file type               e.g. "xlsx"

  {
    var dio = Dio();
    if (noPath) await _folder();

    String savePath = "$path/$filename.$fileFormat";

    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: _showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);

      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  static Future _folder() async {
    path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage
        .DIRECTORY_DOWNLOADS); //all files downloaded into system "Downloads" folder
    noPath = false;
  }

  static void _showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  static getExcelData(String filename)

  ///Decodes xlsx file and returns acquired data
  //Parameters: filename: (String) name of file       (refer to download function above)
  {
    if (noPath) _folder(); //checks if folder has been declared

    try {
      var bytes = File("$path/$filename.xlsx").readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      return excel;
    } catch (e) {
      print(e);
    }
  }
}
