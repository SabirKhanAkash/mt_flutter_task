// dev variables section
const String DEV_BASE_URL = 'https://jsonplaceholder.typicode.com';
const String PROD_BASE_URL = 'https://jsonplaceholder.typicode.com';
const bool isDev = true;
// const bool isDev = false;
const String VERSION_NAME = "0.0.1";

// functions
String getBaseUrl() {
  if (isDev) {
    return DEV_BASE_URL;
  } else {
    return PROD_BASE_URL;
  }
}

bool getDebugBanner() {
  if (isDev) {
    return true;
  } else {
    return false;
  }
}

String getVersionName() {
  return VERSION_NAME;
}
