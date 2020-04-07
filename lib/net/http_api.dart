class HttpApi {
  static const CONNECT_TIMEOUT = 60000;
  static const RECEIVE_TIMEOUT = 60000;

  //
  static const String BASE_URL = 'https://api.pexels.com';
  static const String SEARCH_IMAGE = '/v1/search'; //?query=cat&per_page=15&page=1;
  static const String CURATED_IMAGE = '/v1/curated'; //?per_page=15&page=1
  static const String DETAIL_IMAGE = '/v1/photos/'; //?per_page=15&page=1
  static const String SEARCH_VIDEO = '/videos/search'; //?query=example+query&per_page=15&page=1
  static const String SEARCH_VIDEO_POPULAR = '/videos/popular'; //?per_page=15&page=1
  static const String VIDEO_DETAIL = '/videos/videos/'; //:id
}