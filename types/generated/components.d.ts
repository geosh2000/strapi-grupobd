import type { Schema, Struct } from '@strapi/strapi';

export interface FaqFaq extends Struct.ComponentSchema {
  collectionName: 'components_faq_faqs';
  info: {
    displayName: 'faq';
    icon: 'question';
  };
  attributes: {
    ans: Schema.Attribute.Blocks & Schema.Attribute.Required;
    question: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface MailingFooter extends Struct.ComponentSchema {
  collectionName: 'components_mailing_footers';
  info: {
    displayName: 'footer';
    icon: 'arrowDown';
  };
  attributes: {
    text: Schema.Attribute.RichText;
  };
}

export interface MailingHeader extends Struct.ComponentSchema {
  collectionName: 'components_mailing_headers';
  info: {
    displayName: 'header';
  };
  attributes: {
    bg_color: Schema.Attribute.String &
      Schema.Attribute.CustomField<'plugin::color-picker.color'>;
    image: Schema.Attribute.Media<'images'>;
    title: Schema.Attribute.String;
  };
}

export interface PlansBenefit extends Struct.ComponentSchema {
  collectionName: 'components_plans_benefits';
  info: {
    displayName: 'benefit';
    icon: 'crown';
  };
  attributes: {
    details: Schema.Attribute.String;
    title: Schema.Attribute.String;
  };
}

export interface PlansFeature extends Struct.ComponentSchema {
  collectionName: 'components_plans_features';
  info: {
    displayName: 'feature';
    icon: 'priceTag';
  };
  attributes: {
    feature: Schema.Attribute.String & Schema.Attribute.Required;
    sort: Schema.Attribute.Integer;
  };
}

export interface RoomsRoomCard extends Struct.ComponentSchema {
  collectionName: 'components_rooms_room_cards';
  info: {
    displayName: 'room-card';
    icon: 'stack';
  };
  attributes: {
    carrousel: Schema.Attribute.Media<
      'images' | 'files' | 'videos' | 'audios',
      true
    >;
    description: Schema.Attribute.Blocks;
    main_picture: Schema.Attribute.Media<'images'>;
    name: Schema.Attribute.String;
    room_amenities: Schema.Attribute.Relation<
      'oneToMany',
      'api::room-amenity.room-amenity'
    >;
    room_specs: Schema.Attribute.Component<'rooms.specs', false>;
    short_description: Schema.Attribute.Blocks;
    slug: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.CustomField<
        'plugin::auto-locales-slug.auto-locales-slug',
        {
          pattern: 'name';
        }
      >;
    view_360: Schema.Attribute.Boolean;
    view_360_url: Schema.Attribute.String;
  };
}

export interface RoomsSpecs extends Struct.ComponentSchema {
  collectionName: 'components_rooms_specs';
  info: {
    displayName: 'specs';
    icon: 'bulletList';
  };
  attributes: {
    area_balcony_m2: Schema.Attribute.Integer;
    area_balcony_sq_ft: Schema.Attribute.Integer;
    area_m2: Schema.Attribute.Integer;
    area_sq_ft: Schema.Attribute.Integer;
    bedding: Schema.Attribute.String;
    has_balcony: Schema.Attribute.Boolean;
    has_sofa_bed: Schema.Attribute.Boolean;
    pet_allowed: Schema.Attribute.Boolean;
    pet_extra_cost: Schema.Attribute.Boolean;
    pet_max_weight_kg: Schema.Attribute.Integer;
    pet_max_weight_lbs: Schema.Attribute.Integer;
    pets_allowed: Schema.Attribute.Integer;
    sofa_bed_type: Schema.Attribute.String;
    view: Schema.Attribute.String;
  };
}

export interface SharedBadge extends Struct.ComponentSchema {
  collectionName: 'components_shared_badges';
  info: {
    displayName: 'badge';
    icon: 'grid';
  };
  attributes: {
    badge_id: Schema.Attribute.String;
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    label: Schema.Attribute.String;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'badge'>;
  };
}

export interface SharedButtons extends Struct.ComponentSchema {
  collectionName: 'components_shared_buttons';
  info: {
    displayName: 'buttons';
    icon: 'cursor';
  };
  attributes: {
    button_id: Schema.Attribute.String;
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    label: Schema.Attribute.String & Schema.Attribute.Required;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 1;
        },
        number
      >;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'button'>;
    url: Schema.Attribute.String;
  };
}

export interface SharedCard extends Struct.ComponentSchema {
  collectionName: 'components_shared_cards';
  info: {
    displayName: 'card';
    icon: 'grid';
  };
  attributes: {
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    description: Schema.Attribute.String;
    icon: Schema.Attribute.Media<'images' | 'files' | 'videos' | 'audios'>;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    subtitle: Schema.Attribute.String;
    title: Schema.Attribute.String;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'card'>;
  };
}

export interface SharedContact extends Struct.ComponentSchema {
  collectionName: 'components_shared_contacts';
  info: {
    displayName: 'contact';
    icon: 'phone';
  };
  attributes: {
    contact_mail: Schema.Attribute.String;
    phone_mx: Schema.Attribute.String;
    phone_rest: Schema.Attribute.String;
    phone_us: Schema.Attribute.String;
  };
}

export interface SharedHtml extends Struct.ComponentSchema {
  collectionName: 'components_shared_htmls';
  info: {
    displayName: 'Html';
  };
  attributes: {
    html: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'html';
        }
      >;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'html'>;
  };
}

export interface SharedInput extends Struct.ComponentSchema {
  collectionName: 'components_shared_inputs';
  info: {
    displayName: 'input';
    icon: 'pencil';
  };
  attributes: {
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    defaultValue: Schema.Attribute.String;
    hidden: Schema.Attribute.Boolean;
    input_id: Schema.Attribute.String;
    inputType: Schema.Attribute.Enumeration<
      ['text', 'number', 'select', 'radio', 'checkbox']
    >;
    label: Schema.Attribute.String;
    name: Schema.Attribute.String;
    placeholder: Schema.Attribute.String;
    readOnly: Schema.Attribute.Boolean;
    regex: Schema.Attribute.String;
    required: Schema.Attribute.Boolean;
    section: Schema.Attribute.String;
    selectValues: Schema.Attribute.JSON &
      Schema.Attribute.CustomField<'plugin::strapi-code-editor-custom-field.code-editor-json'>;
    sort: Schema.Attribute.Integer;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'input'>;
  };
}

export interface SharedMedia extends Struct.ComponentSchema {
  collectionName: 'components_shared_media';
  info: {
    displayName: 'Media';
    icon: 'file-video';
  };
  attributes: {
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    file: Schema.Attribute.Media<'images' | 'files' | 'videos'>;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'media'>;
  };
}

export interface SharedNavLinks extends Struct.ComponentSchema {
  collectionName: 'components_shared_nav_links';
  info: {
    displayName: 'navLinks';
    icon: 'bulletList';
  };
  attributes: {
    label: Schema.Attribute.String;
    sectionId: Schema.Attribute.String;
  };
}

export interface SharedOpenGraph extends Struct.ComponentSchema {
  collectionName: 'components_shared_open_graphs';
  info: {
    displayName: 'openGraph';
    icon: 'project-diagram';
  };
  attributes: {
    ogDescription: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetMinMaxLength<{
        maxLength: 200;
      }>;
    ogImage: Schema.Attribute.Media<'images'>;
    ogTitle: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetMinMaxLength<{
        maxLength: 70;
      }>;
    ogType: Schema.Attribute.String;
    ogUrl: Schema.Attribute.String;
  };
}

export interface SharedPlainText extends Struct.ComponentSchema {
  collectionName: 'components_shared_plain_texts';
  info: {
    displayName: 'plainText';
    icon: 'italic';
  };
  attributes: {
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    text: Schema.Attribute.String;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'text'>;
  };
}

export interface SharedQuote extends Struct.ComponentSchema {
  collectionName: 'components_shared_quotes';
  info: {
    displayName: 'Quote';
    icon: 'indent';
  };
  attributes: {
    body: Schema.Attribute.Text;
    title: Schema.Attribute.String;
  };
}

export interface SharedRichText extends Struct.ComponentSchema {
  collectionName: 'components_shared_rich_texts';
  info: {
    description: '';
    displayName: 'Rich text';
    icon: 'align-justify';
  };
  attributes: {
    body: Schema.Attribute.RichText;
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'markdown'>;
    wrapper: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'html';
        }
      >;
  };
}

export interface SharedSeo extends Struct.ComponentSchema {
  collectionName: 'components_shared_seos';
  info: {
    displayName: 'seo';
    icon: 'search';
  };
  attributes: {
    canonicalURL: Schema.Attribute.String;
    keywords: Schema.Attribute.Text;
    metaDescription: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetMinMaxLength<{
        maxLength: 160;
        minLength: 50;
      }>;
    metaImage: Schema.Attribute.Media<'images'>;
    metaRobots: Schema.Attribute.String;
    metaTitle: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetMinMaxLength<{
        maxLength: 60;
      }>;
    metaViewport: Schema.Attribute.String;
    openGraph: Schema.Attribute.Component<'shared.open-graph', false>;
    structuredData: Schema.Attribute.JSON;
  };
}

export interface SharedShowContact extends Struct.ComponentSchema {
  collectionName: 'components_shared_show_contacts';
  info: {
    displayName: 'showContact';
    icon: 'phone';
  };
  attributes: {
    class: Schema.Attribute.Text;
    contact: Schema.Attribute.String;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    icon: Schema.Attribute.Media<'images' | 'files' | 'videos' | 'audios'>;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'contact'>;
  };
}

export interface SharedSlider extends Struct.ComponentSchema {
  collectionName: 'components_shared_sliders';
  info: {
    description: '';
    displayName: 'Slider';
    icon: 'address-book';
  };
  attributes: {
    files: Schema.Attribute.Media<'images', true>;
  };
}

export interface SharedSocialMedia extends Struct.ComponentSchema {
  collectionName: 'components_shared_social_medias';
  info: {
    displayName: 'socialMedia';
    icon: 'user';
  };
  attributes: {
    altText: Schema.Attribute.String;
    class: Schema.Attribute.Text;
    css: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'css';
        }
      >;
    icon: Schema.Attribute.Media<'images' | 'files' | 'videos' | 'audios'>;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'socialMedia'>;
    url: Schema.Attribute.String;
  };
}

export interface SimpleComponentsLink extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_links';
  info: {
    displayName: 'link';
    icon: 'link';
  };
  attributes: {
    href: Schema.Attribute.Text;
    icon: Schema.Attribute.Media<'images'>;
    label: Schema.Attribute.String;
    order: Schema.Attribute.Integer;
    target: Schema.Attribute.Enumeration<
      ['_self', '_blank', '_parent', '_top']
    >;
  };
}

export interface SimpleComponentsLinkTree extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_link_trees';
  info: {
    displayName: 'link_tree';
    icon: 'bulletList';
  };
  attributes: {
    column: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
    links: Schema.Attribute.Relation<'oneToMany', 'api::link.link'>;
    order: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
    title: Schema.Attribute.String;
  };
}

export interface SimpleComponentsMedia extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_media';
  info: {
    displayName: 'media';
    icon: 'picture';
  };
  attributes: {
    media: Schema.Attribute.Media<'images' | 'files' | 'videos' | 'audios'>;
    order: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
    title: Schema.Attribute.String;
  };
}

export interface SimpleComponentsSeparator extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_separators';
  info: {
    displayName: 'separator';
  };
  attributes: {
    active: Schema.Attribute.Boolean & Schema.Attribute.DefaultTo<true>;
    order: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'faq.faq': FaqFaq;
      'mailing.footer': MailingFooter;
      'mailing.header': MailingHeader;
      'plans.benefit': PlansBenefit;
      'plans.feature': PlansFeature;
      'rooms.room-card': RoomsRoomCard;
      'rooms.specs': RoomsSpecs;
      'shared.badge': SharedBadge;
      'shared.buttons': SharedButtons;
      'shared.card': SharedCard;
      'shared.contact': SharedContact;
      'shared.html': SharedHtml;
      'shared.input': SharedInput;
      'shared.media': SharedMedia;
      'shared.nav-links': SharedNavLinks;
      'shared.open-graph': SharedOpenGraph;
      'shared.plain-text': SharedPlainText;
      'shared.quote': SharedQuote;
      'shared.rich-text': SharedRichText;
      'shared.seo': SharedSeo;
      'shared.show-contact': SharedShowContact;
      'shared.slider': SharedSlider;
      'shared.social-media': SharedSocialMedia;
      'simple-components.link': SimpleComponentsLink;
      'simple-components.link-tree': SimpleComponentsLinkTree;
      'simple-components.media': SimpleComponentsMedia;
      'simple-components.separator': SimpleComponentsSeparator;
    }
  }
}
