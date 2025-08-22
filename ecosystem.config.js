// ecosystem.config.js
module.exports = {
  apps: [
    {
      name: 'strapi-prod',
      script: 'server.js',
      env: {
        NODE_ENV: 'production',
      },
      // Comando que se ejecuta antes de iniciar la app
      pre_start: 'npm run build'
    },
  ],
};
