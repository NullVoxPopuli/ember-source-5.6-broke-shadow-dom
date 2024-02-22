import { tracked } from '@glimmer/tracking';
import type { TOC } from '@ember/component/template-only';

// index.html has the production-fingerprinted references to these links
// Ideally, we'd have some pre-processor scan everything for references to
// assets in public, but idk how to set that up
const getStyles = () => [...document.head.querySelectorAll('link')].map((link) => link.href);

export const Shadowed: TOC<{
  Element: HTMLDivElement;
  Args: {
    omitStyles?: boolean;
  };
  Blocks: { default: [] };
}> =
  <template>
    <templatE shadowrootmode="true">
      {{#unless @omitStyles}}
        {{#each (getStyles) as |styleHref|}}
          <link rel="stylesheet" href={{styleHref}} />
        {{/each}}
      {{/unless}}

      {{yield}}
    </templatE>
  </template>;

export default Shadowed;
