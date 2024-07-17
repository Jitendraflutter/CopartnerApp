import 'package:assignment/core/end_point.dart';

import '../api_services.dart';

class CopartnerApiService extends ApiService {

  fetchCopartnerList(String id) async {
    return await api.get(
      EndPoint.getCopartner+"$id",
    );
  }

///add privacy details
}
