"use strict";
// import type { Core } from '@strapi/strapi';
Object.defineProperty(exports, "__esModule", { value: true });
const getPlanName = async (strapi, parent) => {
    var _a, _b, _c, _d;
    if (!parent) {
        return null;
    }
    const planValue = parent.plan;
    if (typeof parent.id === 'number') {
        const relation = await strapi.db.connection('components_plans_comparison_plans_plan_lnk')
            .select('plan_id')
            .where({ comparison_plan_id: parent.id })
            .first();
        if (typeof (relation === null || relation === void 0 ? void 0 : relation.plan_id) === 'number') {
            const entity = await strapi.db.query('api::plan.plan').findOne({
                where: { id: relation.plan_id },
                select: ['name'],
            });
            if (typeof (entity === null || entity === void 0 ? void 0 : entity.name) === 'string' && entity.name.length > 0) {
                return entity.name;
            }
        }
    }
    if (!planValue) {
        return null;
    }
    if (typeof planValue === 'object') {
        const plan = planValue;
        if (typeof plan.name === 'string' && plan.name.length > 0) {
            return plan.name;
        }
        if (typeof plan.documentId === 'string' && plan.documentId.length > 0) {
            const document = await strapi.documents('api::plan.plan').findOne({
                documentId: plan.documentId,
                fields: ['name'],
            });
            return (_a = document === null || document === void 0 ? void 0 : document.name) !== null && _a !== void 0 ? _a : null;
        }
        if (typeof plan.id === 'number') {
            const entity = await strapi.db.query('api::plan.plan').findOne({
                where: { id: plan.id },
                select: ['name'],
            });
            return (_b = entity === null || entity === void 0 ? void 0 : entity.name) !== null && _b !== void 0 ? _b : null;
        }
    }
    if (typeof planValue === 'string') {
        const document = await strapi.documents('api::plan.plan').findOne({
            documentId: planValue,
            fields: ['name'],
        });
        return (_c = document === null || document === void 0 ? void 0 : document.name) !== null && _c !== void 0 ? _c : null;
    }
    if (typeof planValue === 'number') {
        const entity = await strapi.db.query('api::plan.plan').findOne({
            where: { id: planValue },
            select: ['name'],
        });
        return (_d = entity === null || entity === void 0 ? void 0 : entity.name) !== null && _d !== void 0 ? _d : null;
    }
    return null;
};
exports.default = {
    /**
     * An asynchronous register function that runs before
     * your application is initialized.
     *
     * This gives you an opportunity to extend code.
     */
    register({ strapi }) {
        var _a;
        const extensionService = (_a = strapi.plugin('graphql')) === null || _a === void 0 ? void 0 : _a.service('extension');
        if (!extensionService) {
            return;
        }
        extensionService.use({
            typeDefs: `
        extend type ComponentPlansComparisonPlan {
          planName: String
        }
      `,
            resolvers: {
                ComponentPlansComparisonPlan: {
                    planName: {
                        resolve: async (parent) => {
                            return getPlanName(strapi, parent);
                        },
                    },
                },
            },
        });
    },
    /**
     * An asynchronous bootstrap function that runs before
     * your application gets started.
     *
     * This gives you an opportunity to set up your data model,
     * run jobs, or perform some special logic.
     */
    bootstrap( /* { strapi }: { strapi: Core.Strapi } */) { },
};
