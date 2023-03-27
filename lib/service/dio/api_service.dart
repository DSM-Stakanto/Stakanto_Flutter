

import 'package:dio/dio.dart';

const url = 'http://3.112.203.180:8080';
final dio = Dio();
class Service {
    Future<String?> login(String name, String password) async {
        try {
            final response = await dio.post(
                '$url/auth/login',
                data: {'accountID': name, 'password': password},
            );
            if (response.statusCode == 200) {
                print('성공');
                return '성공';
            } else {
                print('실패');
                return '실패';
            }
        } catch (e) {
            print(e);
        }
    }

    Future<String?> signUp(String accountID, String password, String image, String name) async {
        try {
            final response = await dio.post(
                '$url/auth/sign-up',
                data: {'accountID': accountID,
                    'password': password,
                    'image' : image,
                    'name' : name},
            );
            if (response.statusCode == 200) {
                print('성공');
                return '성공';
            } else {
                print('실패');
                return '실패';
            }
        } catch (e) {
            print(e);
        }
    }

    Future<String?> genre(String genre) async {
        try {
            Response response;
            response = await dio.get('/music/$genre');
            print(response.data.toString());
            // The below request is the same as above.
            // response = await dio.get(
            //
            // );
            print(response.data.toString());
        } catch (e) {
            print(e);
        }
    }
}