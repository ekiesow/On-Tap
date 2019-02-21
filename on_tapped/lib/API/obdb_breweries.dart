

class BreweryList {
  final List<Brewery> breweries;

  BreweryList({
    this.breweries,
  });

  factory BreweryList.fromJson(List<dynamic> parsedJson) {
    List<Brewery> breweries = new List<Brewery>();
    breweries = parsedJson.map((i)=>Brewery.fromJson(i)).toList();

    return new BreweryList(
      breweries: breweries,
    );
  }

}

class Brewery {
  final int id;
  final String name;
  final String breweryType;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String longitude;
  final String latitude;
  final String phone;
  final String websiteUrl;

  Brewery({
    this.id,
    this.name,
    this.breweryType,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,


  });

  factory Brewery.fromJson(Map<String, dynamic> json) {
    return new Brewery(
      id: json['id'],
      name: json['name'],
      breweryType: json['brewery_type'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      phone: json['phone'],
      websiteUrl: json['website_url'],
    );
  }

}