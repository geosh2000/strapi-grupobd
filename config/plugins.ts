export default () => ({
  graphql: {
    enabled: true,
    config: {
      playgroundAlways: true, // fuerza usar el Playground en vez de Apollo Sandbox
      defaultLimit: 25,
      maxLimit: 100,
      apolloServer: {
        tracing: false,
      },
    },
  },
  'strapi-code-editor-custom-field': {
    enabled: true,
  },
});