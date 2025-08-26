export default [
  'strapi::logger',
  'strapi::errors',
  {
    name: 'strapi::cors',
    config: {
      origin: [
        'http://localhost:3000',
        'https://5cad8ca31fb4.ngrok-free.app',
      ],
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
      headers: '*',
    },
  },
  {
    name: 'strapi::security',
    config: {
      contentSecurityPolicy: {
        useDefaults: true,
        directives: {
          'img-src': ["'self'", "data:", "blob:", "https://market-assets.strapi.io", "'self'", "data:", "cdn.jsdelivr.net", "strapi.io", "apollo-server-landing-page.cdn.apollographql.com"],
          'script-src-elem': ["'self'", "'unsafe-inline'", 'cdn.jsdelivr.net', "https://embeddable-sandbox.cdn.apollographql.com"],
          upgradeInsecureRequests: null,
        },
        disableAdmin: false, // esto permite scripts externos en el admin
      },
    },
  },
  'strapi::poweredBy',
  'strapi::query',
  'strapi::body',
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
];
