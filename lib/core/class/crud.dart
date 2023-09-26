import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:taskflutter/core/class/statusrequest.dart';
import '../functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data, Map<String, String> headers) async {
    if (await checkInternet()) {
      var response =
          await http.post(Uri.parse(linkurl), body: data, headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
      String linkurl, Map<String, String> headers) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        print(responsebody);
        print('=======${response}');
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  postFileAndData(
      String linkUrl, Map data, Map<String, String> headers, File file) async {
    var request = http.MultipartRequest('Post', Uri.parse(linkUrl));
    int fileLength = await file.length();
    var streamData = http.ByteStream(file.openRead());
    var multiFile = http.MultipartFile('image', streamData, fileLength,
        filename: basename(file.path));
    request.files.add(multiFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    request.headers.addAll(headers);
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      print("postMultiData1============ $responsebody");

      return Right(responsebody);
    } else {
      print("postMultiData1============ ${response.body}");

      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postMutipleImagesAndData(String linkurl,
      Map data, Map<String, String> headers, images, List nameImage) async {
    var uri = Uri.parse(linkurl);
    var request = http.MultipartRequest('POST', uri);
    for (int i = 0; i < images.length; i++) {
      request.files.add(
        http.MultipartFile(
          nameImage[i].toString(),
          http.ByteStream(images[i].openRead()),
          await images[i].length(),
          filename: basename(images[i].path),
        ),
      );
    }
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    request.headers.addAll(headers);

    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200 || myRequest.statusCode == 201) {
      return Right(jsonDecode(response.body));
    } else {
      print(response.body);
      return const Left(StatusRequest.serverfailure);
    }
  }
}
