import type { Schema, Struct } from '@strapi/strapi';

export interface BlocksComparative extends Struct.ComponentSchema {
  collectionName: 'components_blocks_comparatives';
  info: {
    displayName: 'Comparative';
    icon: 'dashboard';
  };
  attributes: {
    Title: Schema.Attribute.String;
    Values: Schema.Attribute.Enumeration<['uno', 'dos', 'tres']>;
  };
}

export interface BlocksHero extends Struct.ComponentSchema {
  collectionName: 'components_blocks_heroes';
  info: {
    displayName: 'Hero';
    icon: 'apps';
  };
  attributes: {
    background: Schema.Attribute.Media<
      'images' | 'files' | 'videos' | 'audios'
    >;
    description: Schema.Attribute.RichText;
    sort: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 1;
        },
        number
      >;
    subtitle: Schema.Attribute.String;
    title: Schema.Attribute.String;
  };
}

export interface FaqFaq extends Struct.ComponentSchema {
  collectionName: 'components_faq_faqs';
  info: {
    displayName: 'faq';
    icon: 'question';
  };
  attributes: {
    answer: Schema.Attribute.String & Schema.Attribute.Required;
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

export interface MailingMailBody extends Struct.ComponentSchema {
  collectionName: 'components_mailing_mail_bodies';
  info: {
    displayName: 'mailBody';
    icon: 'bulletList';
  };
  attributes: {
    html: Schema.Attribute.Text &
      Schema.Attribute.CustomField<
        'plugin::strapi-code-editor-custom-field.code-editor-text',
        {
          language: 'html';
        }
      >;
    json_text: Schema.Attribute.JSON &
      Schema.Attribute.CustomField<'plugin::strapi-code-editor-custom-field.code-editor-json'>;
    media: Schema.Attribute.Media<
      'images' | 'files' | 'videos' | 'audios',
      true
    >;
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
    sort: Schema.Attribute.Integer;
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
    sort: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 1;
        },
        number
      >;
    url: Schema.Attribute.String;
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
    privacy_policy_link: Schema.Attribute.String;
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
    sort: Schema.Attribute.Integer;
  };
}

export interface SharedMedia extends Struct.ComponentSchema {
  collectionName: 'components_shared_media';
  info: {
    displayName: 'Media';
    icon: 'file-video';
  };
  attributes: {
    file: Schema.Attribute.Media<'images' | 'files' | 'videos'>;
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
    name: Schema.Attribute.String;
    sort: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
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

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'blocks.comparative': BlocksComparative;
      'blocks.hero': BlocksHero;
      'faq.faq': FaqFaq;
      'mailing.footer': MailingFooter;
      'mailing.header': MailingHeader;
      'mailing.mail-body': MailingMailBody;
      'shared.badge': SharedBadge;
      'shared.buttons': SharedButtons;
      'shared.contact': SharedContact;
      'shared.html': SharedHtml;
      'shared.media': SharedMedia;
      'shared.nav-links': SharedNavLinks;
      'shared.open-graph': SharedOpenGraph;
      'shared.quote': SharedQuote;
      'shared.rich-text': SharedRichText;
      'shared.seo': SharedSeo;
      'shared.slider': SharedSlider;
    }
  }
}
