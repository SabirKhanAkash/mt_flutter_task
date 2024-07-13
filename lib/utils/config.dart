const String DEV_BASE_URL = 'https://jsonplaceholder.typicode.com';
const String PROD_BASE_URL = 'https://jsonplaceholder.typicode.com';
const bool isDev = true;

/// const bool isDev = false;
const String VERSION_NAME = "0.0.1";

/// to get the api base url
String getBaseUrl() {
  if (isDev) {
    return DEV_BASE_URL;
  } else {
    return PROD_BASE_URL;
  }
}

/// to show the debug banner
bool getDebugBanner() {
  if (isDev) {
    return true;
  } else {
    return false;
  }
}

/// to get the version name
String getVersionName() {
  return VERSION_NAME;
}
