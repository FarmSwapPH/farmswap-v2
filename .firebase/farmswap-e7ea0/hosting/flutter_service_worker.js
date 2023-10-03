'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "7b91fd71be82ad8b97e017d7ddb4b31f",
"assets/AssetManifest.smcbin": "6a28ffbb3ffa2ae00f873e507ee9f7ad",
"assets/assets/images/category/chili.jpg": "3088d6a934b8e4c5cdeff354c314848b",
"assets/assets/images/category/chinese%2520eggplant.jpg": "ddc3f5cfc9414ec8da0498065db2f9e5",
"assets/assets/images/category/green%2520mangoi.jpg": "cd4a9a28cee9c4519ca6690884e4198b",
"assets/assets/images/category/kankong.webp": "9f896928647d1a26e61b27bc152377aa",
"assets/assets/images/category/kasoy.jpg": "4b653aecf467600e9438d2476b965332",
"assets/assets/images/category/mango.jpg": "87c18af245604687ca64ac1a56636c04",
"assets/assets/images/category/nuts.jpg": "9f473524476ef26b985084de2e691280",
"assets/assets/images/category/pechay.jpg": "5658584a7931a27cb999bdb60a0997d7",
"assets/assets/images/dummy/guyabano.jpg": "cd0f48a6b010abe1cc8ba579a7c38091",
"assets/assets/images/dummy/okra.jpg": "2512f5f15989e8e855deb9cdd1e2a840",
"assets/assets/images/listing/item.png": "e1b15b7fbb9ef7427087b28aa1693f88",
"assets/assets/images/Logo.png": "7412f28c9a9707c9f403893c419a1477",
"assets/assets/images/onboarding2.svg": "6026a9ce8bafeb1df6f04283775d8300",
"assets/assets/images/onboard_group.png": "6026a9ce8bafeb1df6f04283775d8300",
"assets/assets/images/payment%2520badges/gcash.png": "6800c0e7fcd8ed9aaea8a2175fa5d031",
"assets/assets/images/payment%2520badges/gpay.png": "51ee3434aaa2f0b7ddd25618c686e5ad",
"assets/assets/images/payment%2520badges/maya.png": "e5f795f14deee1d25055b2754cad8373",
"assets/assets/images/person.png": "16921173b898ca618b0da20d064da67f",
"assets/assets/images/png/consumer.svg": "0e61ded2ad39a0d272ce53cef0bf423f",
"assets/assets/images/png/farmer.png": "3e16d38d5227cac6884e160ae7502467",
"assets/assets/images/png/onion.png": "2b7169da423160af167fe509327f55e1",
"assets/assets/svg/auth/back-arrow.svg": "b8bb5b107a024207c6fd06b67c2bca56",
"assets/assets/svg/auth/check.svg": "2f2db0b65159a49fac58a48167eebd64",
"assets/assets/svg/auth/fb.svg": "1a5d177a4fed4a03a310555d9eff7a7a",
"assets/assets/svg/auth/google.svg": "f0393580b3774cd1aacd0b778b58ce8a",
"assets/assets/svg/auth/Lock.svg": "d57366a5128e941a612198ac3dfe5dee",
"assets/assets/svg/auth/Message.svg": "cc08e0f92c7d9bb3350d6258ba071541",
"assets/assets/svg/auth/Pattern.svg": "16993324ea7da479bc88068b62d2365b",
"assets/assets/svg/auth/Profile.svg": "d5f61a7b692930f560346ef14bbb728f",
"assets/assets/svg/bio/bio-pattern.svg": "413bc11f4a9a1993dd7503116c003849",
"assets/assets/svg/bottom%2520nav/Buy.svg": "c12117284f4908ca49a4aa74662283a3",
"assets/assets/svg/bottom%2520nav/Chat.svg": "e54f7bd8674506bf460757336301d409",
"assets/assets/svg/bottom%2520nav/Home.svg": "f0045af7bc01ea64a7deee0eaaacd0b0",
"assets/assets/svg/bottom%2520nav/Profile.svg": "5e75ba73a301c7b671d5ee21cc342e62",
"assets/assets/svg/dashboard/check.svg": "141dfa26bb1b08bb352192764e8c4aa9",
"assets/assets/svg/dashboard/delivery%2520icon.svg": "24cc0646456136f036c1e8abf830fb1b",
"assets/assets/svg/dashboard/Filter.svg": "3db92292de335f3a2307e1d60b088b3a",
"assets/assets/svg/dashboard/Icon%2520Notification.svg": "1f97e806dcfc976c3e7abeac0da88c3b",
"assets/assets/svg/dashboard/Icon%2520Search.svg": "a77f04b6fc8b1039b6fee846ea5d8524",
"assets/assets/svg/dashboard/Pattern.svg": "acec55907b313c2b5100625d9dd11516",
"assets/assets/svg/forgot%2520password/Email.svg": "af1840814a66c37dba7e64efdf19ddef",
"assets/assets/svg/forgot%2520password/Message.svg": "26b8db1d1cf8dc52ab51e23074193a9e",
"assets/assets/svg/logo/svg/FARMSWAP%2520LOGO%2520horizontal.svg": "327623d32dd28b7d17f5860c343f33c0",
"assets/assets/svg/logo/svg/FARMSWAP%2520LOGO%2520only.svg": "ff1576dadc6d7dd7779dc1f69b6be423",
"assets/assets/svg/logo/svg/FARMSWAP%2520LOGO.svg": "760c4867561a4c569b41ad4727ea7364",
"assets/assets/svg/onboarding/onboarding1.svg": "6db397a1ca25cc24598a502805e7593f",
"assets/assets/svg/onboarding/onboarding2.svg": "8fcfcd61fbb1d2f8ad2250ae0ec047cc",
"assets/assets/svg/splash_pattern.svg": "16f64132bf3302cebe8d640f20008db9",
"assets/assets/svg/success/bg-pattern.svg": "18dc4b242f8bf70acd8000549b5fca2f",
"assets/assets/svg/success/success-icon.svg": "eb13bffc9ab51e4e1252bc60133abc7f",
"assets/assets/svg/upload%2520photo/camera.svg": "ca316ea93bfc9c5624168de60c462207",
"assets/assets/svg/upload%2520photo/Gallery.svg": "3da46f84eb223e347629504fa15d0638",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c620c2d306073f8557d07e8062f29691",
"assets/NOTICES": "4d4380f4071db5ae12c2bc6a81a4e2ed",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "1897be5a1a593499e2fdc6c34cd6d8a2",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "2c5b1c137725c0530d447b376fa90830",
"icons/Icon-512.png": "03af1ed3ff45cdf9344b2fa89a9011d8",
"icons/Icon-maskable-192.png": "2c5b1c137725c0530d447b376fa90830",
"icons/Icon-maskable-512.png": "03af1ed3ff45cdf9344b2fa89a9011d8",
"index.html": "75c54872a3962b0ea38285d1a457c1e9",
"/": "75c54872a3962b0ea38285d1a457c1e9",
"main.dart.js": "2b9965efa19b8a8067468d3b2f48a913",
"manifest.json": "ce9d7ca7793ced80f3d355314862f3ea",
"version.json": "fe398669b325a78b75f1deaf82f8d860"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
