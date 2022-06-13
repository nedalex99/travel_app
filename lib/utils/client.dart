import 'package:http/http.dart' as http;
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization_response.dart';
import 'package:travel_app/utils/session_temp.dart';

class AuthorizedClient extends http.BaseClient {
  AuthorizedClient() : _inner = http.Client();

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = amadeusAccessToken;
    request.headers['Authorization'] = 'Bearer $token';

    final response = await _inner.send(request);

    if (response.statusCode == 401) {
      String newToken = "";
      await Authorization().authorize().then(
            (value) => {
              if (value.statusCode == 200)
                {
                  newToken = (value as AuthorizationResponse)
                      .authorizationResponseModel
                      .accessToken,
                }
            },
          );
      print(newToken);
      request.headers['Authorization'] = 'Bearer $newToken';

      // throws error: Bad state: Can't finalize a finalized Request
      final retryResponse = await _inner.send(request);

      return retryResponse;
    }

    return response;
  }
}
