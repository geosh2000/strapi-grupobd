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
const getButtonsCtasByIds = async (strapi, componentIds) => {
    if (componentIds.length === 0) {
        return [];
    }
    const rows = await strapi.db.connection('components_buttons_ctas').select('*').whereIn('id', componentIds);
    const rowsById = new Map(rows.map((row) => [row.id, row]));
    return componentIds
        .map((componentId) => rowsById.get(componentId))
        .filter((row) => Boolean(row));
};
const getComponentCtaSet = async (strapi, parent, cmpsTable) => {
    if (typeof (parent === null || parent === void 0 ? void 0 : parent.id) !== 'number') {
        return [];
    }
    if (parent.cta_mode === 'existing') {
        const selectedCtaRows = await strapi.db
            .connection(cmpsTable)
            .select('cmp_id')
            .where({
            entity_id: parent.id,
            field: 'selected_cta',
            component_type: 'buttons.selected-cta',
        })
            .orderBy('order', 'asc');
        const selectedCtaIds = selectedCtaRows
            .map((row) => row.cmp_id)
            .filter((cmpId) => typeof cmpId === 'number');
        if (selectedCtaIds.length === 0) {
            return [];
        }
        const selectedLinks = await strapi.db
            .connection('components_buttons_selected_ctas_cta_lnk')
            .select('selected_cta_id', 'cta_id')
            .whereIn('selected_cta_id', selectedCtaIds);
        const ctaIdsInOrder = selectedCtaIds
            .map((selectedCtaId) => {
            var _a, _b;
            return (_b = (_a = selectedLinks.find((link) => link.selected_cta_id === selectedCtaId)) === null || _a === void 0 ? void 0 : _a.cta_id) !== null && _b !== void 0 ? _b : null;
        })
            .filter((ctaId) => typeof ctaId === 'number');
        if (ctaIdsInOrder.length === 0) {
            return [];
        }
        const ctaComponentRows = await strapi.db
            .connection('ctas_cmps')
            .select('entity_id', 'cmp_id')
            .where({
            field: 'cta',
            component_type: 'buttons.cta',
        })
            .whereIn('entity_id', ctaIdsInOrder);
        const ctaComponentIds = ctaIdsInOrder
            .map((ctaId) => { var _a, _b; return (_b = (_a = ctaComponentRows.find((row) => row.entity_id === ctaId)) === null || _a === void 0 ? void 0 : _a.cmp_id) !== null && _b !== void 0 ? _b : null; })
            .filter((cmpId) => typeof cmpId === 'number');
        return getButtonsCtasByIds(strapi, ctaComponentIds);
    }
    const ctaRows = await strapi.db
        .connection(cmpsTable)
        .select('cmp_id')
        .where({
        entity_id: parent.id,
        field: 'cta',
        component_type: 'buttons.cta',
    })
        .orderBy('order', 'asc');
    const ctaComponentIds = ctaRows
        .map((row) => row.cmp_id)
        .filter((cmpId) => typeof cmpId === 'number');
    return getButtonsCtasByIds(strapi, ctaComponentIds);
};
const getTitleSubtitleDescriptionCtaSet = async (strapi, parent) => {
    return getComponentCtaSet(strapi, parent, 'components_shared_title_subtitle_descriptions_cmps');
};
const getHeroCtaSet = async (strapi, parent) => {
    return getComponentCtaSet(strapi, parent, 'components_sections_heroes_cmps');
};
const getSingleCardCtaSet = async (strapi, parent) => {
    return getComponentCtaSet(strapi, parent, 'components_shared_single_cards_cmps');
};
const getNavbarCtaSet = async (strapi, parent) => {
    return getComponentCtaSet(strapi, parent, 'navbars_cmps');
};
const getLinkDestination = async (strapi, parent) => {
    var _a, _b, _c, _d, _e;
    if (!parent) {
        return null;
    }
    if (parent.link_type === 'section') {
        return (_a = parent.section) !== null && _a !== void 0 ? _a : null;
    }
    if (parent.link_type === 'url' && parent.href) {
        return parent.href;
    }
    if (parent.link_type === 'link' && ((_b = parent.link) === null || _b === void 0 ? void 0 : _b.href)) {
        return parent.link.href;
    }
    if (parent.href) {
        return parent.href;
    }
    let entity = null;
    if (typeof parent.documentId === 'string' && parent.documentId.length > 0) {
        entity = await strapi.documents('api::link.link').findOne({
            documentId: parent.documentId,
            fields: ['link_type', 'section'],
            populate: {
                link: {
                    fields: ['href'],
                },
            },
        });
    }
    else if (typeof parent.id === 'number') {
        entity = await strapi.db.query('api::link.link').findOne({
            where: { id: parent.id },
            select: ['link_type', 'section'],
            populate: {
                link: {
                    select: ['href'],
                },
            },
        });
    }
    if (!entity) {
        return null;
    }
    if (entity.link_type === 'section') {
        return (_c = entity.section) !== null && _c !== void 0 ? _c : null;
    }
    if (entity.link_type === 'link') {
        return (_e = (_d = entity.link) === null || _d === void 0 ? void 0 : _d.href) !== null && _e !== void 0 ? _e : null;
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

        extend type ComponentSharedTitleSubtitleDescription {
          ctaSet: [ComponentButtonsCta]
        }

        extend type ComponentSectionsHero {
          ctaSet: [ComponentButtonsCta]
        }

        extend type ComponentSharedSingleCard {
          ctaSet: [ComponentButtonsCta]
        }

        extend type Navbar {
          ctaSet: [ComponentButtonsCta]
        }

        extend type Link {
          destination: String
        }

        extend type ComponentSimpleComponentsLink {
          destination: String
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
                ComponentSharedTitleSubtitleDescription: {
                    ctaSet: {
                        resolve: async (parent) => {
                            return getTitleSubtitleDescriptionCtaSet(strapi, parent);
                        },
                    },
                },
                ComponentSectionsHero: {
                    ctaSet: {
                        resolve: async (parent) => {
                            return getHeroCtaSet(strapi, parent);
                        },
                    },
                },
                ComponentSharedSingleCard: {
                    ctaSet: {
                        resolve: async (parent) => {
                            return getSingleCardCtaSet(strapi, parent);
                        },
                    },
                },
                Navbar: {
                    ctaSet: {
                        resolve: async (parent) => {
                            return getNavbarCtaSet(strapi, parent);
                        },
                    },
                },
                Link: {
                    destination: {
                        resolve: async (parent) => {
                            return getLinkDestination(strapi, parent);
                        },
                    },
                },
                ComponentSimpleComponentsLink: {
                    destination: {
                        resolve: async (parent) => {
                            return getLinkDestination(strapi, parent);
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
