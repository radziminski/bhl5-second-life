import 'package:SecondLife/dtos/api/offer_dto.dart';
import 'package:SecondLife/locator.dart';
import 'package:SecondLife/services/api_service.dart';
import 'package:flutter/material.dart';

class OffersModel extends ChangeNotifier {
  final ApiService service = locator<ApiService>();

  List<OfferDto> exploredOffers = [];
  List<OfferDto> likedOffers = [];
  List<OfferDto> dislikedOffers = [];

  Future<List<OfferDto>> getExploreOffers() async {
    List<OfferDto> offers = await service.getAllOffers();
    exploredOffers = offers;
  }

  Future likeOffer(String user, int offerId) async {
    await service.likeOffer(user, offerId);
    int likedOfferIndex =
        exploredOffers.indexWhere((offer) => offer.id == offerId);
    OfferDto likedOffer = exploredOffers[likedOfferIndex];

    exploredOffers.removeAt(likedOfferIndex);
    likedOffers.add(likedOffer);
    notifyListeners();
  }

  void dislikeOffer(String user, int offerId) {
    int dislikedOfferIndex =
        exploredOffers.indexWhere((offer) => offer.id == offerId);
    OfferDto likedOffer = exploredOffers[dislikedOfferIndex];

    exploredOffers.removeAt(dislikedOfferIndex);
    dislikedOffers.add(likedOffer);
    notifyListeners();
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
    await service.createOffer(
      title: title,
      description: description,
      imageUrls: imageUrls,
      latitude: latitude,
      longitude: longitude,
      owner: owner,
      itemCategories: itemCategories,
      priceCategory: priceCategory,
    );
  }

  void clear() {
    exploredOffers = [];
    likedOffers = [];
    dislikedOffers = [];
  }
}
