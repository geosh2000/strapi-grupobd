export default ({ env }) => ({
  graphql: {
    config: {
      endpoint: '/graphql',
      shadowCRUD: true,
      landingPage: (strapi) => env("NODE_ENV") !== "production",
      apolloServer: {
        introspection: true, // permite introspection incluso en prod
      },
    },
  },
  'strapi-code-editor-custom-field': {
    enabled: true,
  },
});