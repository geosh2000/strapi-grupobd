"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = ({ env }) => ({
    graphql: {
        config: {
            endpoint: '/graphql',
            shadowCRUD: true,
            landingPage: (strapi) => {
                if (env("NODE_ENV") !== "production") {
                    return true;
                }
                else {
                    return false;
                }
            },
        },
    },
    'strapi-code-editor-custom-field': {
        enabled: true,
    },
});
