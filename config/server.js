module.exports = ({ env }) => ({
  host: '0.0.0.0',
  port: 1337,
  app: {
    keys: env.array('APP_KEYS', ['someRandomKey']),
  },
  admin: {
    serveAdminPanel: true,
  },
  url: 'https://strapi.grupobd.mx',
  allowedHosts: ['strapi.grupobd.mx'],
});
