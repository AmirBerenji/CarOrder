// To parse this JSON data, do
//
//     final prediction = predictionFromJson(jsonString);

import 'dart:convert';

Prediction predictionFromJson(String str) => Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
    final String? type;
    final List<Feature>? features;
    final Query? query;

    Prediction({
        this.type,
        this.features,
        this.query,
    });

    factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        type: json["type"],
        features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
        "query": query?.toJson(),
    };
}

class Feature {
    final String? type;
    final Properties? properties;
    final Geometry? geometry;
    final List<double>? bbox;

    Feature({
        this.type,
        this.properties,
        this.geometry,
        this.bbox,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties?.toJson(),
        "geometry": geometry?.toJson(),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
    };
}

class Geometry {
    final String? type;
    final List<double>? coordinates;

    Geometry({
        this.type,
        this.coordinates,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}

class Properties {
    final String? country;
    final String? countryCode;
    final String? state;
    final String? city;
    final Datasource? datasource;
    final double? lon;
    final double? lat;
    final int? population;
    final String? resultType;
    final String? formatted;
    final String? addressLine1;
    final String? addressLine2;
    final String? category;
    final Timezone? timezone;
    final String? plusCode;
    final Rank? rank;
    final String? placeId;
    final String? postcode;
    final String? suburb;
    final String? plusCodeShort;

    Properties({
        this.country,
        this.countryCode,
        this.state,
        this.city,
        this.datasource,
        this.lon,
        this.lat,
        this.population,
        this.resultType,
        this.formatted,
        this.addressLine1,
        this.addressLine2,
        this.category,
        this.timezone,
        this.plusCode,
        this.rank,
        this.placeId,
        this.postcode,
        this.suburb,
        this.plusCodeShort,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        country: json["country"],
        countryCode: json["country_code"],
        state: json["state"],
        city: json["city"],
        datasource: json["datasource"] == null ? null : Datasource.fromJson(json["datasource"]),
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        population: json["population"],
        resultType: json["result_type"],
        formatted: json["formatted"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        category: json["category"],
        timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
        plusCode: json["plus_code"],
        rank: json["rank"] == null ? null : Rank.fromJson(json["rank"]),
        placeId: json["place_id"],
        postcode: json["postcode"],
        suburb: json["suburb"],
        plusCodeShort: json["plus_code_short"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "country_code": countryCode,
        "state": state,
        "city": city,
        "datasource": datasource?.toJson(),
        "lon": lon,
        "lat": lat,
        "population": population,
        "result_type": resultType,
        "formatted": formatted,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "category": category,
        "timezone": timezone?.toJson(),
        "plus_code": plusCode,
        "rank": rank?.toJson(),
        "place_id": placeId,
        "postcode": postcode,
        "suburb": suburb,
        "plus_code_short": plusCodeShort,
    };
}

class Datasource {
    final String? sourcename;
    final String? attribution;
    final String? license;
    final String? url;

    Datasource({
        this.sourcename,
        this.attribution,
        this.license,
        this.url,
    });

    factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
        sourcename: json["sourcename"],
        attribution: json["attribution"],
        license: json["license"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "sourcename": sourcename,
        "attribution": attribution,
        "license": license,
        "url": url,
    };
}

class Rank {
    final int? confidence;
    final int? confidenceCityLevel;
    final String? matchType;

    Rank({
        this.confidence,
        this.confidenceCityLevel,
        this.matchType,
    });

    factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        confidence: json["confidence"],
        confidenceCityLevel: json["confidence_city_level"],
        matchType: json["match_type"],
    );

    Map<String, dynamic> toJson() => {
        "confidence": confidence,
        "confidence_city_level": confidenceCityLevel,
        "match_type": matchType,
    };
}

class Timezone {
    final String? name;
    final String? offsetStd;
    final int? offsetStdSeconds;
    final String? offsetDst;
    final int? offsetDstSeconds;

    Timezone({
        this.name,
        this.offsetStd,
        this.offsetStdSeconds,
        this.offsetDst,
        this.offsetDstSeconds,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        offsetStd: json["offset_STD"],
        offsetStdSeconds: json["offset_STD_seconds"],
        offsetDst: json["offset_DST"],
        offsetDstSeconds: json["offset_DST_seconds"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "offset_STD": offsetStd,
        "offset_STD_seconds": offsetStdSeconds,
        "offset_DST": offsetDst,
        "offset_DST_seconds": offsetDstSeconds,
    };
}

class Query {
    final String? text;
    final Parsed? parsed;

    Query({
        this.text,
        this.parsed,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        text: json["text"],
        parsed: json["parsed"] == null ? null : Parsed.fromJson(json["parsed"]),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "parsed": parsed?.toJson(),
    };
}

class Parsed {
    final String? city;
    final String? expectedType;

    Parsed({
        this.city,
        this.expectedType,
    });

    factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        city: json["city"],
        expectedType: json["expected_type"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "expected_type": expectedType,
    };
}
