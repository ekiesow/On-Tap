
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:on_tapped/API/obdb_breweries.dart';

class BuildBreweryCard extends StatefulWidget {
  final Brewery currentBrewery;

  const BuildBreweryCard({Key key, this.currentBrewery}) : super(key: key);

  @override
  _BuildBreweryCardState createState() => _BuildBreweryCardState();
}

class _BuildBreweryCardState extends State<BuildBreweryCard> {
  bool _expandedCard = false;

  @override
  Widget build(BuildContext context) {
    Brewery currentBrewery = widget.currentBrewery;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: (){
          setState(() {
            _expandedCard = !_expandedCard;
          });
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          currentBrewery.name,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.star_border), onPressed: () {}
                    //TODO: add saved method
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  breweryInfoText(
                      currentBrewery, "${currentBrewery.breweryType} brewery"),
                ]..addAll(_expandedCard ? expandedInfo(currentBrewery) : briefInfo(currentBrewery)),
              ),
            ],
          ),
          //buildBriefCard(currentBrewery),
        ),
      ),
    );
  }

  List<Widget> briefInfo(Brewery currentBrewery){
    return [
      breweryInfoText(currentBrewery,
          "${currentBrewery.city}, ${currentBrewery.state}"),
    ];
  }

  List<Widget> expandedInfo(Brewery currentBrewery){
    return [
      breweryInfoText(currentBrewery, "${currentBrewery.street}"),
      breweryInfoText(currentBrewery,
          "${currentBrewery.city}, ${currentBrewery.state}, ${currentBrewery.country}"),
      phoneField(currentBrewery),
    ];
  }

  Widget phoneField(Brewery currentBrewery){
    return Row(
      children: <Widget>[
        IconButton(icon: Icon(Icons.phone),
          onPressed: () {
            _launch_URL(currentBrewery);
          },),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: breweryInfoText(currentBrewery, "${currentBrewery.phone}"),
        ),
      ],
    );
  }
  
  _launch_URL(Brewery currentBrewery) async {
    var phone = currentBrewery.phone;
    if(await canLaunch('tel: $phone')){
      await launch('tel: $phone');
    }
    else{
      throw "Could not launch Phone";
    }
  }

  Widget breweryInfoText(Brewery currentBrewery, String breweryText) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
      child: Text(
        breweryText,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16.0,
        ),
      ),
    );
  }
}
