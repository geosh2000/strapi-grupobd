import type { Schema, Struct } from '@strapi/strapi';

export interface ButtonsCta extends Struct.ComponentSchema {
  collectionName: 'components_buttons_ctas';
  info: {
    displayName: 'cta';
  };
  attributes: {
    has_primary_cta: Schema.Attribute.Boolean;
    has_secondary_cta: Schema.Attribute.Boolean;
    primary_cta_caption: Schema.Attribute.String;
    primary_cta_label: Schema.Attribute.String;
    primary_cta_link: Schema.Attribute.Text;
    primary_cta_style: Schema.Attribute.Enumeration<
      ['solid', 'outline', 'link']
    >;
    primary_cta_type: Schema.Attribute.Enumeration<['link', 'section', 'slug']>;
    secondary_cta_caption: Schema.Attribute.String;
    secondary_cta_label: Schema.Attribute.String;
    secondary_cta_link: Schema.Attribute.Text;
    secondary_cta_style: Schema.Attribute.Enumeration<
      ['solid', 'outline', 'link']
    >;
    secondary_cta_type: Schema.Attribute.Enumeration<
      ['link', 'section', 'slug']
    >;
  };
}

export interface DesignVisualSetup extends Struct.ComponentSchema {
  collectionName: 'components_design_visual_setups';
  info: {
    displayName: 'visual_setup';
  };
  attributes: {
    content_alignment: Schema.Attribute.Enumeration<
      ['left', 'center', 'right']
    >;
    custom_text_color: Schema.Attribute.String &
      Schema.Attribute.CustomField<'plugin::color-picker.color'>;
    layout_variant: Schema.Attribute.Enumeration<
      ['full-screen', 'half', 'contained', 'split', 'minimal']
    >;
    show_scroll_indicator: Schema.Attribute.Boolean &
      Schema.Attribute.DefaultTo<false>;
    text_color_theme: Schema.Attribute.Enumeration<['light', 'dark', 'custom']>;
    vertical_alignment: Schema.Attribute.Enumeration<
      ['top', 'center', 'bottom']
    >;
  };
}

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

export interface MediaBackgroundMedia extends Struct.ComponentSchema {
  collectionName: 'components_media_background_medias';
  info: {
    displayName: 'background_media';
  };
  attributes: {
    backgroud_image: Schema.Attribute.Media<'images'>;
    background_color: Schema.Attribute.String &
      Schema.Attribute.CustomField<'plugin::color-picker.color'>;
    background_type: Schema.Attribute.Enumeration<['none', 'image', 'video']>;
    background_video: Schema.Attribute.Media<'videos'>;
    overlay_color: Schema.Attribute.String &
      Schema.Attribute.CustomField<'plugin::color-picker.color'>;
    overlay_enabled: Schema.Attribute.Boolean;
    overlay_opacity: Schema.Attribute.Decimal &
      Schema.Attribute.SetMinMax<
        {
          max: 1;
          min: 0;
        },
        number
      >;
  };
}

export interface PlansBenefit extends Struct.ComponentSchema {
  collectionName: 'components_plans_benefits';
  info: {
    displayName: 'benefit';
    icon: 'crown';
  };
  attributes: {
    details: Schema.Attribute.RichText;
    title: Schema.Attribute.String;
  };
}

export interface PlansComparisonPlan extends Struct.ComponentSchema {
  collectionName: 'components_plans_comparison_plans';
  info: {
    displayName: 'comparison-plan';
    icon: 'check';
  };
  attributes: {
    caption: Schema.Attribute.String;
    included: Schema.Attribute.Boolean &
      Schema.Attribute.Required &
      Schema.Attribute.DefaultTo<false>;
    plan: Schema.Attribute.Relation<'oneToOne', 'api::plan.plan'> &
      Schema.Attribute.Required;
  };
}

export interface PlansComparisonRow extends Struct.ComponentSchema {
  collectionName: 'components_plans_comparison_rows';
  info: {
    displayName: 'comparison-row';
    icon: 'bulletList';
  };
  attributes: {
    benefit_details: Schema.Attribute.RichText;
    benefit_label: Schema.Attribute.String;
    row_type: Schema.Attribute.Enumeration<['benefit', 'separator']> &
      Schema.Attribute.Required &
      Schema.Attribute.DefaultTo<'benefit'>;
    separator_svg: Schema.Attribute.JSON &
      Schema.Attribute.CustomField<
        'plugin::strapi-plugin-iconhub.iconhub',
        {
          storeIconData: true;
          storeIconName: true;
        }
      >;
    separator_title: Schema.Attribute.String;
    values: Schema.Attribute.Component<'plans.comparison-plan', true>;
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

export interface SectionsCards extends Struct.ComponentSchema {
  collectionName: 'components_sections_cards';
  info: {
    displayName: 'Cards';
  };
  attributes: {
    card: Schema.Attribute.Component<'shared.single-card', true>;
    content: Schema.Attribute.Component<
      'shared.title-subtitle-description',
      false
    >;
  };
}

export interface SectionsContact extends Struct.ComponentSchema {
  collectionName: 'components_sections_contacts';
  info: {
    displayName: 'contact';
  };
  attributes: {
    content: Schema.Attribute.Component<
      'shared.title-subtitle-description',
      false
    >;
    image: Schema.Attribute.Component<'simple-components.media', false>;
    show_mail: Schema.Attribute.Boolean;
    show_phone_mx: Schema.Attribute.Boolean;
    show_phone_rest: Schema.Attribute.Boolean;
    show_phone_us: Schema.Attribute.Boolean;
  };
}

export interface SectionsHero extends Struct.ComponentSchema {
  collectionName: 'components_sections_heroes';
  info: {
    displayName: 'Hero';
  };
  attributes: {
    background: Schema.Attribute.Component<'media.background-media', false>;
    content: Schema.Attribute.Component<
      'shared.title-subtitle-description',
      false
    >;
    cta: Schema.Attribute.Component<'buttons.cta', false>;
    id_anchor: Schema.Attribute.String;
    tagline: Schema.Attribute.String;
  };
}

export interface SectionsPlanComparison extends Struct.ComponentSchema {
  collectionName: 'components_sections_plan_comparisons';
  info: {
    displayName: 'plan-comparison';
  };
  attributes: {
    content: Schema.Attribute.Component<
      'shared.title-subtitle-description',
      false
    >;
    id_anchor: Schema.Attribute.String;
    plans: Schema.Attribute.Relation<'oneToMany', 'api::plan.plan'>;
    rows: Schema.Attribute.Component<'plans.comparison-row', true>;
  };
}

export interface SectionsThankyou extends Struct.ComponentSchema {
  collectionName: 'components_sections_thankyous';
  info: {
    displayName: 'thankyou';
  };
  attributes: {
    content: Schema.Attribute.Component<
      'shared.title-subtitle-description',
      false
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

export interface SharedIconImage extends Struct.ComponentSchema {
  collectionName: 'components_shared_icon_images';
  info: {
    displayName: 'icon_image';
  };
  attributes: {
    icon: Schema.Attribute.JSON &
      Schema.Attribute.CustomField<
        'plugin::strapi-plugin-iconhub.iconhub',
        {
          storeIconData: true;
          storeIconName: true;
        }
      >;
    image: Schema.Attribute.Media<'images'>;
    type: Schema.Attribute.Enumeration<['icon', 'image']>;
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

export interface SharedSingleCard extends Struct.ComponentSchema {
  collectionName: 'components_shared_single_cards';
  info: {
    displayName: 'single_card';
  };
  attributes: {
    background_color: Schema.Attribute.String &
      Schema.Attribute.CustomField<'plugin::color-picker.color'>;
    card_carousel: Schema.Attribute.Media<'images' | 'videos', true>;
    card_icon: Schema.Attribute.JSON &
      Schema.Attribute.CustomField<
        'plugin::strapi-plugin-iconhub.iconhub',
        {
          storeIconData: true;
          storeIconName: true;
        }
      >;
    card_image: Schema.Attribute.Media<
      'images' | 'files' | 'videos' | 'audios'
    >;
    card_video: Schema.Attribute.Media<'videos'>;
    content: Schema.Attribute.Component<
      'shared.title-subtitle-description',
      true
    >;
    cta: Schema.Attribute.Component<'buttons.cta', false>;
    has_cta: Schema.Attribute.Boolean & Schema.Attribute.DefaultTo<false>;
    has_media: Schema.Attribute.Boolean & Schema.Attribute.DefaultTo<false>;
    media_type: Schema.Attribute.Enumeration<
      ['icon', 'image', 'video', 'carousel']
    >;
    order: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
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
    icon_type: Schema.Attribute.Enumeration<['image', 'svg']>;
    in_section: Schema.Attribute.Boolean;
    name: Schema.Attribute.String;
    section: Schema.Attribute.String;
    sort: Schema.Attribute.Integer;
    svg: Schema.Attribute.JSON &
      Schema.Attribute.CustomField<
        'plugin::strapi-plugin-iconhub.iconhub',
        {
          storeIconData: true;
          storeIconName: true;
        }
      >;
    type: Schema.Attribute.String & Schema.Attribute.DefaultTo<'socialMedia'>;
    url: Schema.Attribute.String;
  };
}

export interface SharedTitleSubtitleDescription extends Struct.ComponentSchema {
  collectionName: 'components_shared_title_subtitle_descriptions';
  info: {
    displayName: 'title_subtitle_description';
  };
  attributes: {
    cta: Schema.Attribute.Component<'buttons.cta', true>;
    description: Schema.Attribute.RichText;
    footer: Schema.Attribute.RichText;
    subtitle: Schema.Attribute.RichText;
    title: Schema.Attribute.String;
  };
}

export interface SimpleComponentsColumn extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_columns';
  info: {
    displayName: 'column';
    icon: 'layer';
  };
  attributes: {
    column: Schema.Attribute.Integer &
      Schema.Attribute.SetMinMax<
        {
          min: 0;
        },
        number
      >;
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

export interface SimpleComponentsContactTree extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_contact_trees';
  info: {
    displayName: 'contact_tree';
  };
  attributes: {
    contact: Schema.Attribute.Component<'shared.contact', false> &
      Schema.Attribute.Required;
    info: Schema.Attribute.Component<'simple-components.column', false> &
      Schema.Attribute.Required;
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
    info: Schema.Attribute.Component<'simple-components.column', false> &
      Schema.Attribute.Required;
    links: Schema.Attribute.Relation<'oneToMany', 'api::link.link'>;
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

export interface SimpleComponentsSocialTree extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_social_trees';
  info: {
    displayName: 'social_tree';
  };
  attributes: {
    info: Schema.Attribute.Component<'simple-components.column', false> &
      Schema.Attribute.Required;
    social_media: Schema.Attribute.Component<'shared.social-media', true>;
  };
}

export interface SimpleComponentsTextTree extends Struct.ComponentSchema {
  collectionName: 'components_simple_components_text_trees';
  info: {
    displayName: 'text_tree';
  };
  attributes: {
    info: Schema.Attribute.Component<'simple-components.column', false> &
      Schema.Attribute.Required;
    text: Schema.Attribute.RichText;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'buttons.cta': ButtonsCta;
      'design.visual-setup': DesignVisualSetup;
      'faq.faq': FaqFaq;
      'mailing.footer': MailingFooter;
      'mailing.header': MailingHeader;
      'media.background-media': MediaBackgroundMedia;
      'plans.benefit': PlansBenefit;
      'plans.comparison-plan': PlansComparisonPlan;
      'plans.comparison-row': PlansComparisonRow;
      'plans.feature': PlansFeature;
      'rooms.room-card': RoomsRoomCard;
      'rooms.specs': RoomsSpecs;
      'sections.cards': SectionsCards;
      'sections.contact': SectionsContact;
      'sections.hero': SectionsHero;
      'sections.plan-comparison': SectionsPlanComparison;
      'sections.thankyou': SectionsThankyou;
      'shared.badge': SharedBadge;
      'shared.buttons': SharedButtons;
      'shared.card': SharedCard;
      'shared.contact': SharedContact;
      'shared.html': SharedHtml;
      'shared.icon-image': SharedIconImage;
      'shared.input': SharedInput;
      'shared.media': SharedMedia;
      'shared.nav-links': SharedNavLinks;
      'shared.open-graph': SharedOpenGraph;
      'shared.plain-text': SharedPlainText;
      'shared.quote': SharedQuote;
      'shared.rich-text': SharedRichText;
      'shared.seo': SharedSeo;
      'shared.show-contact': SharedShowContact;
      'shared.single-card': SharedSingleCard;
      'shared.slider': SharedSlider;
      'shared.social-media': SharedSocialMedia;
      'shared.title-subtitle-description': SharedTitleSubtitleDescription;
      'simple-components.column': SimpleComponentsColumn;
      'simple-components.contact-tree': SimpleComponentsContactTree;
      'simple-components.link': SimpleComponentsLink;
      'simple-components.link-tree': SimpleComponentsLinkTree;
      'simple-components.media': SimpleComponentsMedia;
      'simple-components.separator': SimpleComponentsSeparator;
      'simple-components.social-tree': SimpleComponentsSocialTree;
      'simple-components.text-tree': SimpleComponentsTextTree;
    }
  }
}
