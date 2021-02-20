import 'dart:ui';

import 'package:SecondLife/locator.dart';
import 'package:SecondLife/state/auth_model.dart';
import 'package:SecondLife/state/offers_model.dart';
import 'package:SecondLife/widgets/OfferCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const mockImages = [
  [
    'https://www.peppermillinteriors.com/image/catalog/products/chr-403-ra-vintage-style-armchair/vintage-style-armchair.jpg',
    'https://previews.123rf.com/images/technobulka/technobulka1712/technobulka171200038/91301121-red-vintage-sprint-scooter-oldschool.jpg',
    'https://img1.elektrobike-online.com/UB-Wattitud-Old-Timer-Old-School-E-Bike-gallerySquareTeaser-990bd9ef-1573817.jpg',
  ],
  [
    'https://www.meblewojcik.com.pl/gfx/meblewojcik/userfiles/kolekcje/cortina/mw_cortina_nowosci.jpg',
    'https://images.all-free-download.com/images/graphicthumb/modern_living_room_boutique_picture_167584.jpg',
    'https://images.all-free-download.com/images/graphiclarge/fine_furniture_sofa_02_hd_pictures_167796.jpg',
    'https://images.all-free-download.com/images/graphiclarge/04_hd_pictures_167779.jpg',
    'https://images.all-free-download.com/images/graphiclarge/interior_design_and_creative_sofa_01_hd_pictures_167791.jpg'
  ],
  [
    'https://images.all-free-download.com/images/graphiclarge/keyboard_computer_electronics_264654.jpg',
    'https://images.all-free-download.com/images/graphiclarge/computer_mouse_201790.jpg',
    'https://images.all-free-download.com/images/graphiclarge/computer_monitor_isolated_195430.jpg',
    'https://images.all-free-download.com/images/graphiclarge/old_tv_hd_picture_5_168677.jpg',
    'https://images.all-free-download.com/images/graphiclarge/apple_watch_563737.jpg',
    'https://images.pexels.com/photos/1181354/pexels-photo-1181354.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  ],
  [
    'https://images.all-free-download.com/images/graphiclarge/acoustic_guitar_184807.jpg',
    'https://images.all-free-download.com/images/graphiclarge/wireless_microphone_185539.jpg',
    'https://images.all-free-download.com/images/graphiclarge/violin_188018.jpg',
    'https://images.pexels.com/photos/267350/pexels-photo-267350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  ]
];

const kRedColor = Color(0xFFFF6D6D);
const kAnimationDurationMs = 200;

enum OfferOperation {
  like,
  dislike,
}

class OffersSwiper extends StatefulWidget {
  @override
  _OffersSwiperState createState() => _OffersSwiperState();
}

class _OffersSwiperState extends State<OffersSwiper> {
  final OffersModel offersModel = locator<OffersModel>();
  final AuthModel authModel = locator<AuthModel>();

  CarouselController yCarouselController = CarouselController();
  bool _isLoaded = false;
  bool _isHeartBuild = false;
  bool _isCrossBuild = false;
  bool _isCrossShown = false;
  bool _isHeartShown = false;
  bool _showOffer = true;
  int _currentPage = 0;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    offersModel.getExploreOffers()
      ..then((_) {
        if (mounted)
          setState(() {
            _isLoaded = true;
          });
      })
      ..catchError((_) {
        if (mounted)
          setState(() {
            _error = true;
            _isLoaded = true;
          });
      });
  }

  Future _likeOffer() async {
    return _doOfferOperationAnimation(OfferOperation.like);
  }

  Future _dislikeOffer() async {
    int page = _currentPage;
    print(offersModel.exploredOffers[page].title);
    await _doOfferOperationAnimation(OfferOperation.dislike);
    offersModel.dislikeOffer(
        authModel.username, offersModel.exploredOffers[page].id);
  }

  Future _doOfferOperationAnimation(OfferOperation operation) async {
    int page = _currentPage;
    setState(() {
      operation == OfferOperation.like
          ? _isHeartBuild = true
          : _isCrossBuild = true;
    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      operation == OfferOperation.like
          ? _isHeartShown = true
          : _isCrossShown = true;
      _showOffer = false;
    });
    await Future.delayed(Duration(milliseconds: 500));
    operation == OfferOperation.like
        ? await offersModel.likeOffer(
            authModel.username, offersModel.exploredOffers[page].id)
        : await offersModel.dislikeOffer(
            authModel.username, offersModel.exploredOffers[page].id);

    await Future.delayed(Duration(milliseconds: 1000));

    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      operation == OfferOperation.like
          ? _isHeartShown = false
          : _isCrossShown = false;
    });
    await Future.delayed(Duration(milliseconds: kAnimationDurationMs));
    setState(() {
      operation == OfferOperation.like
          ? _isHeartBuild = false
          : _isCrossBuild = false;
    });
    setState(() {
      _showOffer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: offersModel),
      ],
      builder: (context, child) => Container(
        height: double.infinity,
        width: double.infinity,
        child: _isLoaded
            ? Provider.of<OffersModel>(context).exploredOffers != null &&
                    Provider.of<OffersModel>(context).exploredOffers.isNotEmpty
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildAllOffersCarusel(context),
                      _isHeartBuild
                          ? Positioned(
                              child: AnimatedOpacity(
                                opacity: _isHeartShown ? 1 : 0,
                                duration: Duration(
                                    milliseconds: kAnimationDurationMs),
                                child: Icon(Icons.favorite,
                                    color: kRedColor, size: 240),
                              ),
                            )
                          : Container(),
                      _isCrossBuild
                          ? Positioned(
                              child: AnimatedOpacity(
                                opacity: _isCrossShown ? 1 : 0,
                                duration: Duration(
                                    milliseconds: kAnimationDurationMs),
                                child: Icon(Icons.close,
                                    color: kRedColor, size: 240),
                              ),
                            )
                          : Container(),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 0.0,
                            bottom: 40.0,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildIconButton(
                                  context,
                                  onPressed: () {
                                    _dislikeOffer();
                                  },
                                  icon: Icons.close,
                                  iconColor: Colors.red,
                                  size: 28,
                                ),
                                _buildIconButton(
                                  context,
                                  onPressed: () {
                                    _likeOffer();
                                  },
                                  icon: Icons.favorite,
                                  iconColor: Colors.white,
                                  color: kRedColor,
                                  size: 40,
                                ),
                                _buildIconButton(
                                  context,
                                  onPressed: () {
                                    yCarouselController.nextPage(
                                        duration: Duration(milliseconds: 1),
                                        curve: Curves.linear);
                                  },
                                  icon: Icons.skip_next,
                                  iconColor: Colors.green,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(child: Text('No items to show'))
            : Container(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Container(child: CircularProgressIndicator()),
                ),
              ),
      ),
    );
  }

  Widget _buildAllOffersCarusel(context) {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1.0,
          height: double.infinity,
          scrollDirection: Axis.vertical,
          onPageChanged: (page, _) {
            setState(() {
              _currentPage = page;
            });
          }),
      carouselController: yCarouselController,
      items: Provider.of<OffersModel>(context)
          .exploredOffers
          .where((offer) => offer.id != null)
          .map((offer) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Center(
                    child: _buildCurrOfferCarusel(
                        offer.imageUrls, offer.title, offer.description),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCurrOfferCarusel(
      List<String> urls, String title, String subtitle) {
    return AnimatedOpacity(
      opacity: _showOffer ? 1 : 0,
      duration: Duration(milliseconds: kAnimationDurationMs),
      child: GestureDetector(
        onDoubleTap: _likeOffer,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title != null ? title : 'Unknown',
                      style: GoogleFonts.poppins(fontSize: 20.0)),
                  Text(subtitle != null ? subtitle : 'Unknown',
                      style: GoogleFonts.poppins(fontSize: 12.0)),
                ],
              ),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1,
                ),
                items: urls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: OfferCard(url: url),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    context, {
    IconData icon,
    Function onPressed,
    Color iconColor = Colors.white,
    Color color = Colors.white,
    double size = 32,
  }) {
    return FlatButton(
      color: color,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
