enum Flavor { DEV, QA, PROD }

class FlavorTypes {
  static Flavor? appFlavor;

  static String get appTitle {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Flutter template Dev';
      case Flavor.QA:
        return 'Flutter template Qa';
      case Flavor.PROD:
        return 'Flutter template';
      default:
        return 'Flutter template Unknown';
    }
  }

  static String get appBaseURL {
    switch (appFlavor) {
      case Flavor.DEV:
      //10.0.2.2
      // return 'http://10.0.2.2:3000/'; // Got to change the URL
      case Flavor.QA:
      // return "http://stg3api.1veda.in/";
      // return 'https://stg3core.1veda.in/api/core/'; // Got to change the URL
      case Flavor.PROD:
        return 'prod.com'; // Got to change the URLR
      default:
        return 'unknown';
    }
  }
}
