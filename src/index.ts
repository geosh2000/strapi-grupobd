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
      `,
      resolvers: {
        ComponentPlansComparisonPlan: {
          planName: {
            resolve: async (parent: { id?: number; plan?: unknown }) => {
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
  bootstrap(/* { strapi }: { strapi: Core.Strapi } */) {},
};
