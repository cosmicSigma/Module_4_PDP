import '../network.dart';
import '../apis.dart';

class V3 {
  String project_name;
  String version;
  String project_link;
  String organization_link;
  String description;

  V3(this.project_name, this.version, this.project_link, this.organization_link,
      this.description);

  factory V3.fromJson(Map<String, dynamic> json) {
    String project_name = json['project_name'];
    String version = json['version'];
    String project_link = json['project_link'];
    String organization_link = json['organization_link'];
    String description = json['description'];

    return V3(project_name, version, project_link, organization_link, description);
  }

  Map<String, dynamic> toJson() => {
    'project_name':project_name,
    'version':version,
    'project_link':project_link,
    'organization_link':organization_link,
    'description':description,
  };

  @override
  String toString() {
    return 'V3{project_name: $project_name, version: $version, project_link: $project_link, organization_link: $organization_link, description: $description}';
  }
}

void main() async {
  Network http = Network();
  String result = await http.get('api.spacexdata.com', '/v3');
  V3 v3 = http.parseOneV3(result);
  print(v3);
  http.close();
}