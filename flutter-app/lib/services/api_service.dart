import 'package:SecondLife/dtos/api/message_dto.dart';
import 'package:SecondLife/dtos/api/offer_dto.dart';
import 'package:SecondLife/locator.dart';
import 'package:SecondLife/services/api_request_service.dart';

class ApiService {
  final ApiRequestService requestService = locator<ApiRequestService>();

  Future<List<OfferDto>> getAllOffers() async {
    final response = await requestService.client.get('/advertisement');
    List<OfferDto> offers = [];
    for (final offer in response.data) {
      print(offer);
      offers.add(OfferDto.fromJson(offer));
    }
    return offers;
  }

  Future likeOffer(String user, int offerId) {
    // TODO: like offer request
  }

  Future getMyMatches(String user) {
    // TODO: matches request
  }

  Future createOffer({
    String title,
    String description,
    List<String> imageUrls,
    double latitude,
    double longitude,
    String owner,
    List<int> itemCategories,
    int priceCategory,
  }) async {
    final response = await requestService.client.post('/advertisement', data: {
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'latitude': latitude,
      'longitude': longitude,
      'owner': owner,
      'itemCategories': itemCategories,
      'priceCategory': priceCategory,
    });
    print(response);
    print(response.data);
  }

  Future getMessagesForChat(int offerId, String sender, String receiver) async {
    final res = await requestService.client
        .get('https://bhl5-db-messenger.herokuapp.com/chat', queryParameters: {
      "sender_name": sender,
      "receiver_name": receiver,
      "advertisement_id": offerId,
    });
    List<MessageDto> messages = [];

    for (final message in res.data) {
      messages.add(MessageDto.fromJson(message));
    }

    return messages;
  }

  Future postMessagesForChat(
      int offerId, String sender, String receiver, String message) async {
    final res = await requestService.client
        .post('https://bhl5-db-messenger.herokuapp.com/new_message', data: {
      "sender_name": sender,
      "receiver_name": receiver,
      "advertisement_id": offerId,
      "message_content": message,
    });
  }
}
