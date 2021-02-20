import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OfferCard extends StatelessWidget {
  OfferCard({this.url, this.title, this.subTitle});

  final String url;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: CachedNetworkImage(
          imageUrl: url,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(50.0),
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
