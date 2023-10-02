// import 'package:dio/dio.dart';

// class ServerService {
//   late Dio _dio;

//   final String _baseUrl = "https://backend-5efu.vercel.app/";

//   ServerService() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: _baseUrl,
//         headers: {
//           'Content-type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
//   }

//   Future<dynamic> get({
//     required String endpoint,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await _dio.get(endpoint,
//           queryParameters: queryParameters,
//           options: Options(headers: {"Authorization": "Bearer $token"}));

//       return response.data;
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 500) return null;
//       return e.response?.data;
//     }
//   }

//   Future<dynamic> post({
//     required String endpoint,
//     String? token,
//     required Map<String, dynamic> body,
//   }) async {
//     try {
//       final response = await _dio.post(endpoint,
//           data: body,
//           options: Options(headers: {"Authorization": "Bearer $token"}));

//       return response.data;
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 500) return null;
//       return e.response?.data;
//     }
//   }

//   Future<dynamic> postFile(String filePath) async {
//     Dio x = Dio(
//       BaseOptions(
//         baseUrl: "https://api.cloudinary.com/v1_1/dwrk2jyoz/image/upload",
//       ),
//     );
//     FormData formData = FormData.fromMap({
//       'api_key': '971533332311253',
//       'upload_preset': 'socialize',
//       'file': await MultipartFile.fromFile(
//         filePath,
//         filename: filePath.split("/").last,
//       )
//     });
//     try {
//       final response = await x.post(
//         "/",
//         data: formData
//       );

//       return response.data;
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 500) return null;
//       return e.response?.data;
//     }
//   }
// }
