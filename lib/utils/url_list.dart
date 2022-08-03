
class GetUrl {Uri? link(parameter) {
    switch (parameter) {
      case 'playstore':
        return playstore;
        case 'facebook':
        return facebook;
    }
    return null;
  }

  // link
  Uri playstore = Uri.parse('https://play.google.com/store/apps/dev?id=8634826538239733704');
  Uri facebook = Uri.parse('https://facebook.com/retenvi/');

}

