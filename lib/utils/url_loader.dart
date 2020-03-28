import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

ouvreNavigateur(String url) async {
//  const url = 'https://covidvisualizer.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Ce lien ne marche pas $url';
  }
}