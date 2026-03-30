// import type { Core } from '@strapi/strapi';

const getPlanName = async (
  strapi: any,
  parent: { id?: number; plan?: unknown } | null | undefined
) => {
  if (!parent) {
    return null;
  }

  const planValue = parent.plan;

  if (typeof parent.id === 'number') {
    const relation = await strapi.db.connection('components_plans_comparison_plans_plan_lnk')
      .select('plan_id')
      .where({ comparison_plan_id: parent.id })
      .first();

    if (typeof relation?.plan_id === 'number') {
      const entity = await strapi.db.query('api::plan.plan').findOne({
        where: { id: relation.plan_id },
        select: ['name'],
      });

      if (typeof entity?.name === 'string' && entity.name.length > 0) {
        return entity.name;
      }
    }
  }

  if (!planValue) {
    return null;
  }

  if (typeof planValue === 'object') {
    const plan = planValue as { id?: number; documentId?: string; name?: string };

    if (typeof plan.name === 'string' && plan.name.length > 0) {
      return plan.name;
    }

    if (typeof plan.documentId === 'string' && plan.documentId.length > 0) {
      const document = await strapi.documents('api::plan.plan').findOne({
        documentId: plan.documentId,
        fields: ['name'],
      });

      return document?.name ?? null;
    }

    if (typeof plan.id === 'number') {
      const entity = await strapi.db.query('api::plan.plan').findOne({
        where: { id: plan.id },
        select: ['name'],
      });

      return entity?.name ?? null;
    }
  }

  if (typeof planValue === 'string') {
    const document = await strapi.documents('api::plan.plan').findOne({
      documentId: planValue,
      fields: ['name'],
    });

    return document?.name ?? null;
  }

  if (typeof planValue === 'number') {
    const entity = await strapi.db.query('api::plan.plan').findOne({
      where: { id: planValue },
      select: ['name'],
    });

    return entity?.name ?? null;
  }

  return null;
};

const getButtonsCtasByIds = async (strapi: any, componentIds: number[]) => {
  if (componentIds.length === 0) {
    return [];
  }

  const rows = await strapi.db.connection('components_buttons_ctas').select('*').whereIn('id', componentIds);
  const rowsById = new Map(rows.map((row: Record<string, unknown>) => [row.id, row]));

  return componentIds
    .map((componentId) => rowsById.get(componentId))
    .filter((row): row is Record<string, unknown> => Boolean(row));
};

const getComponentCtaSet = async (
  strapi: any,
  parent: { id?: number; cta_mode?: string | null } | null | undefined,
  cmpsTable: string
) => {
  if (typeof parent?.id !== 'number') {
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
      .map((row: { cmp_id?: number }) => row.cmp_id)
      .filter((cmpId: unknown): cmpId is number => typeof cmpId === 'number');

    if (selectedCtaIds.length === 0) {
      return [];
    }

    const selectedLinks = await strapi.db
      .connection('components_buttons_selected_ctas_cta_lnk')
      .select('selected_cta_id', 'cta_id')
      .whereIn('selected_cta_id', selectedCtaIds);

    const ctaIdsInOrder = selectedCtaIds
      .map((selectedCtaId) =>
        selectedLinks.find((link: { selected_cta_id?: number; cta_id?: number }) => link.selected_cta_id === selectedCtaId)
          ?.cta_id ?? null
      )
      .filter((ctaId: unknown): ctaId is number => typeof ctaId === 'number');

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
      .map((ctaId) =>
        ctaComponentRows.find((row: { entity_id?: number; cmp_id?: number }) => row.entity_id === ctaId)?.cmp_id ?? null
      )
      .filter((cmpId: unknown): cmpId is number => typeof cmpId === 'number');

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
    .map((row: { cmp_id?: number }) => row.cmp_id)
    .filter((cmpId: unknown): cmpId is number => typeof cmpId === 'number');

  return getButtonsCtasByIds(strapi, ctaComponentIds);
};

const getTitleSubtitleDescriptionCtaSet = async (
  strapi: any,
  parent: { id?: number; cta_mode?: string | null } | null | undefined
) => {
  return getComponentCtaSet(strapi, parent, 'components_shared_title_subtitle_descriptions_cmps');
};

const getHeroCtaSet = async (
  strapi: any,
  parent: { id?: number; cta_mode?: string | null } | null | undefined
) => {
  return getComponentCtaSet(strapi, parent, 'components_sections_heroes_cmps');
};

const getSingleCardCtaSet = async (
  strapi: any,
  parent: { id?: number; cta_mode?: string | null } | null | undefined
) => {
  return getComponentCtaSet(strapi, parent, 'components_shared_single_cards_cmps');
};

const getNavbarCtaSet = async (
  strapi: any,
  parent: { id?: number; cta_mode?: string | null } | null | undefined
) => {
  return getComponentCtaSet(strapi, parent, 'navbars_cmps');
};

const getLinkDestination = async (
  strapi: any,
  parent:
    | {
        id?: number;
        documentId?: string;
        link_type?: string | null;
        section?: string | null;
        href?: string | null;
        link?: { href?: string | null } | null;
      }
    | null
    | undefined
) => {
  if (!parent) {
    return null;
  }

  if (parent.link_type === 'section') {
    return parent.section ?? null;
  }

  if (parent.link_type === 'url' && parent.href) {
    return parent.href;
  }

  if (parent.link_type === 'link' && parent.link?.href) {
    return parent.link.href;
  }

  if (parent.href) {
    return parent.href;
  }

  let entity: { link_type?: string | null; section?: string | null; link?: { href?: string | null } | null } | null = null;

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
  } else if (typeof parent.id === 'number') {
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
    return entity.section ?? null;
  }

  if (entity.link_type === 'link') {
    return entity.link?.href ?? null;
  }

  return null;
};

export default {
  /**
   * An asynchronous register function that runs before
   * your application is initialized.
   *
   * This gives you an opportunity to extend code.
   */
  register({ strapi }: { strapi: any }) {
    const extensionService = strapi.plugin('graphql')?.service('extension');

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
            resolve: async (parent: { id?: number; plan?: unknown }) => {
              return getPlanName(strapi, parent);
            },
          },
        },
        ComponentSharedTitleSubtitleDescription: {
          ctaSet: {
            resolve: async (parent: { id?: number; cta_mode?: string | null }) => {
              return getTitleSubtitleDescriptionCtaSet(strapi, parent);
            },
          },
        },
        ComponentSectionsHero: {
          ctaSet: {
            resolve: async (parent: { id?: number; cta_mode?: string | null }) => {
              return getHeroCtaSet(strapi, parent);
            },
          },
        },
        ComponentSharedSingleCard: {
          ctaSet: {
            resolve: async (parent: { id?: number; cta_mode?: string | null }) => {
              return getSingleCardCtaSet(strapi, parent);
            },
          },
        },
        Navbar: {
          ctaSet: {
            resolve: async (parent: { id?: number; cta_mode?: string | null }) => {
              return getNavbarCtaSet(strapi, parent);
            },
          },
        },
        Link: {
          destination: {
            resolve: async (parent: {
              id?: number;
              documentId?: string;
              link_type?: string | null;
              section?: string | null;
              href?: string | null;
              link?: { href?: string | null } | null;
            }) => {
              return getLinkDestination(strapi, parent);
            },
          },
        },
        ComponentSimpleComponentsLink: {
          destination: {
            resolve: async (parent: {
              id?: number;
              documentId?: string;
              link_type?: string | null;
              section?: string | null;
              href?: string | null;
              link?: { href?: string | null } | null;
            }) => {
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
  bootstrap(/* { strapi }: { strapi: Core.Strapi } */) {},
};
