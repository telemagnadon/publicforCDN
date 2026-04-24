// public/sw.js
importScripts('/synclib.js');
self.__WB_MANIFEST = (typeof PrecacheStaticURLs !== 'undefined') ? PrecacheStaticURLs : [];
importScripts('/dist/js/workbox-sw.js');

if (workbox) {
  const { registerRoute } = workbox.routing;
  const { precacheAndRoute } = workbox.precaching;
  const { StaleWhileRevalidate, CacheFirst } = workbox.strategies;
  const { BackgroundSyncPlugin } = workbox.backgroundSync;
  const { CacheableResponsePlugin } = workbox.cacheableResponse;
  const { ExpirationPlugin } = workbox.expiration;

  // 1. Precaching static assets
  precacheAndRoute(self.__WB_MANIFEST);

  // 2. Stale-while-revalidate strategy for pages
  const urlsToCache = (typeof PrecacheStaleRevalidateURLs !== 'undefined') ? PrecacheStaleRevalidateURLs : [];
  
  const navigationHandler = new StaleWhileRevalidate({
    cacheName: 'page-stale-while-revalidate-cache',
  });

  registerRoute(
    ({ request }) => {
        try {
            // Handle explicit URLs in the cache list
            return urlsToCache.includes(new URL(request.url).pathname);
        } catch (e) {
            return false;
        }
    },
    navigationHandler
  );

  // 2.1 Navigation Fallback: Handle all other navigation requests (HTML reloads)
  // This ensures that any direct navigation to a SPA route works while offline
  const { NavigationRoute } = workbox.routing;
  registerRoute(new NavigationRoute(navigationHandler));

  // 3. Cache-first strategy for /RequestData/File/ blobs
  registerRoute(
    ({ url }) => url.pathname.startsWith('/RequestData/File/'),
    new CacheFirst({
      cacheName: 'request-data-cache',
      plugins: [
        new CacheableResponsePlugin({
          statuses: [0, 200],
        }),
        new ExpirationPlugin({
          maxAgeSeconds: 30 * 24 * 60 * 60, // 30 days
          maxEntries: 2000,
        }),
      ],
    })
  );

  // 3.1 Cache-first strategy for build assets (hashed files)
  registerRoute(
    ({ url }) => url.pathname.startsWith('/build/assets/'),
    new CacheFirst({
      cacheName: 'build-assets-cache',
      plugins: [
        new CacheableResponsePlugin({
          statuses: [0, 200],
        }),
        new ExpirationPlugin({
          maxAgeSeconds: 180 * 24 * 60 * 60, // 6 months
          maxEntries: 1000,
        }),
      ],
    })
  );


  // 4. Background sync
  const bgSyncPlugin = new BackgroundSyncPlugin('sync-queue', {
    maxRetentionTime: 24 * 60 // 24 hours
  });

  // Example: Apply background sync to POST requests to /api/sync
  registerRoute(
    ({ url }) => url.pathname.includes('/api/sync'),
    new workbox.strategies.NetworkOnly({
      plugins: [bgSyncPlugin],
    }),
    'POST'
  );
}

// 5. Message passing to clients
function postMessageToClients(data) {
  self.clients.matchAll().then(clients => {
    clients.forEach(client => {
      client.postMessage(data);
    });
  });
}

self.addEventListener('install', event => {
  self.skipWaiting();
});

self.addEventListener('activate', event => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener('message', event => {
  if (event.data && event.data.type === 'PING') {
    postMessageToClients({ type: 'PONG' });
  }
});
