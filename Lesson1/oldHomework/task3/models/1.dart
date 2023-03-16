import '../network.dart';

class Roadster {
  String name;
  String launch_date_utc;
  num launch_date_unix;
  num launch_mass_kg;
  num launch_mass_lbs;
  num norad_id;
  num epoch_jd;
  String orbit_type;
  num apoapsis_au;
  num periapsis_au;
  num semi_major_axis_au;
  num eccentricity;
  num inclination;
  num longitude;
  num periapsis_arg;
  num period_days;
  num speed_kph;
  num speed_mph;
  num earth_distance_km;
  num earth_distance_mi;
  num mars_distance_km;
  num mars_distance_mi;
  List flickr_images;
  String wikipedia;
  String video;
  String details;

  Roadster(
      this.name,
      this.launch_date_utc,
      this.launch_date_unix,
      this.launch_mass_kg,
      this.launch_mass_lbs,
      this.norad_id,
      this.epoch_jd,
      this.orbit_type,
      this.apoapsis_au,
      this.periapsis_au,
      this.semi_major_axis_au,
      this.eccentricity,
      this.inclination,
      this.longitude,
      this.periapsis_arg,
      this.period_days,
      this.speed_kph,
      this.speed_mph,
      this.earth_distance_km,
      this.earth_distance_mi,
      this.mars_distance_km,
      this.mars_distance_mi,
      this.flickr_images,
      this.wikipedia,
      this.video,
      this.details);

  factory Roadster.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String launch_date_utc = json['launch_date_utc'];
    num launch_date_unix = json['launch_date_unix'];
    num launch_mass_kg = json['launch_mass_kg'];
    num launch_mass_lbs = json['launch_mass_lbs'];
    num norad_id = json['norad_id'];
    num epoch_jd = json['epoch_jd'];
    String orbit_type = json['orbit_type'];
    num apoapsis_au = json['apoapsis_au'];
    num periapsis_au = json['periapsis_au'];
    num semi_major_axis_au = json['semi_major_axis_au'];
    num eccentricity = json['eccentricity'];
    num inclination = json['inclination'];
    num longitude = json['longitude'];
    num periapsis_arg = json['periapsis_arg'];
    num period_days = json['period_days'];
    num speed_kph = json['speed_kph'];
    num speed_mph = json['speed_mph'];
    num earth_distance_km = json['earth_distance_km'];
    num earth_distance_mi = json['earth_distance_mi'];
    num mars_distance_km = json['mars_distance_km'];
    num mars_distance_mi = json['mars_distance_mi'];
    List flickr_images = json['flickr_images'];
    String wikipedia = json['wikipedia'];
    String video = json['video'];
    String details = json['details'];

    return Roadster(name, launch_date_utc, launch_date_unix, launch_mass_kg, launch_mass_lbs, norad_id, epoch_jd, orbit_type, apoapsis_au, periapsis_au, semi_major_axis_au, eccentricity, inclination, longitude, periapsis_arg, period_days, speed_kph, speed_mph, earth_distance_km, earth_distance_mi, mars_distance_km, mars_distance_mi, flickr_images, wikipedia, video, details);
  }

  Map<String, dynamic> toJson() => {
    'name':name,
    'launch_date_utc':launch_date_utc,
    'launch_date_unix':launch_date_unix,
    'launch_mass_kg':launch_mass_kg,
    'launch_mass_lbs':launch_mass_lbs,
    'norad_id':norad_id,
    'epoch_jd':epoch_jd,
    'orbit_type':orbit_type,
    'apoapsis_au':apoapsis_au,
    'periapsis_au':periapsis_au,
    'semi_major_axis_au':semi_major_axis_au,
    'eccentricity':eccentricity,
    'inclination':inclination,
    'longitude':longitude,
    'periapsis_arg':periapsis_arg,
    'period_days':period_days,
    'speed_kph':speed_kph,
    'speed_mph':speed_mph,
    'earth_distance_km':earth_distance_km,
    'earth_distance_mi':earth_distance_mi,
    'mars_distance_km':mars_distance_km,
    'mars_distance_mi':mars_distance_mi,
    'flickr_images':flickr_images,
    'wikipedia':wikipedia,
    'video':video,
    'details':details,
  };


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Roadster &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          launch_date_utc == other.launch_date_utc &&
          launch_date_unix == other.launch_date_unix &&
          launch_mass_kg == other.launch_mass_kg &&
          launch_mass_lbs == other.launch_mass_lbs &&
          norad_id == other.norad_id &&
          epoch_jd == other.epoch_jd &&
          orbit_type == other.orbit_type &&
          apoapsis_au == other.apoapsis_au &&
          periapsis_au == other.periapsis_au &&
          semi_major_axis_au == other.semi_major_axis_au &&
          eccentricity == other.eccentricity &&
          inclination == other.inclination &&
          longitude == other.longitude &&
          periapsis_arg == other.periapsis_arg &&
          period_days == other.period_days &&
          speed_kph == other.speed_kph &&
          speed_mph == other.speed_mph &&
          earth_distance_km == other.earth_distance_km &&
          earth_distance_mi == other.earth_distance_mi &&
          mars_distance_km == other.mars_distance_km &&
          mars_distance_mi == other.mars_distance_mi &&
          flickr_images == other.flickr_images &&
          wikipedia == other.wikipedia &&
          video == other.video &&
          details == other.details;

  @override
  int get hashCode =>
      name.hashCode ^
      launch_date_utc.hashCode ^
      launch_date_unix.hashCode ^
      launch_mass_kg.hashCode ^
      launch_mass_lbs.hashCode ^
      norad_id.hashCode ^
      epoch_jd.hashCode ^
      orbit_type.hashCode ^
      apoapsis_au.hashCode ^
      periapsis_au.hashCode ^
      semi_major_axis_au.hashCode ^
      eccentricity.hashCode ^
      inclination.hashCode ^
      longitude.hashCode ^
      periapsis_arg.hashCode ^
      period_days.hashCode ^
      speed_kph.hashCode ^
      speed_mph.hashCode ^
      earth_distance_km.hashCode ^
      earth_distance_mi.hashCode ^
      mars_distance_km.hashCode ^
      mars_distance_mi.hashCode ^
      flickr_images.hashCode ^
      wikipedia.hashCode ^
      video.hashCode ^
      details.hashCode;

  @override
  String toString() {
    return 'Roadster{name: $name, launch_date_utc: $launch_date_utc, launch_date_unix: $launch_date_unix, launch_mass_kg: $launch_mass_kg, launch_mass_lbs: $launch_mass_lbs, norad_id: $norad_id, epoch_jd: $epoch_jd, orbit_type: $orbit_type, apoapsis_au: $apoapsis_au, periapsis_au: $periapsis_au, semi_major_axis_au: $semi_major_axis_au, eccentricity: $eccentricity, inclination: $inclination, longitude: $longitude, periapsis_arg: $periapsis_arg, period_days: $period_days, speed_kph: $speed_kph, speed_mph: $speed_mph, earth_distance_km: $earth_distance_km, earth_distance_mi: $earth_distance_mi, mars_distance_km: $mars_distance_km, mars_distance_mi: $mars_distance_mi, flickr_images: $flickr_images, wikipedia: $wikipedia, video: $video, details: $details}';
  }
}


void main() async {
  Network http = Network();
  String result = await http.get("api.spacexdata.com", '/v3/roadster');
  Roadster roadster = http.parseOneRoadster(result);
  print(roadster);
  http.close();
}