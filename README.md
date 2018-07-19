# XOD Documentation

This repository contains the source of [XOD](https://github.com/xodio/xod/)
documentation which is served at https://xod.io/docs/

## Structure overview

All content sources are under `./docs` directory. Each subdirectory (and the
root `./docs` as well) correspond to a single page on https://xod.io/docs/. If a
user requests `https://xod.io/docs/foo/bar/` the system looks for a
`./docs/foo/bar/README.md` file.

The `README.md` is an entry point for each page. It’s a file written in
[`Markdown`](https://www.markdownguide.org/) syntax so that the authors can
focus on content rather than on layout issues. Nevertheless, `README.md` may
include raw HTML and Handlebars template mixins for cases when a page is hard to
write in plain Markdown. As you might expect, `README.md` may also refer to
images and other asset files located next to it.

### Translations

Pages can contain translations to other languages. `README.md` holds the English
version whereas nearby `DE.md`, `IT.md`, `RU.md`, etc hold its translations. The
site chooses its source depending on the language drop-down selection falling
back to English if no translation is found for a particular page.

See [Analog sensors guide](./docs/guide/analog-sensor-node) for an example.

### YAML data

Some pages like the [Supported Hardware](./docs/reference/supported-hardware)
present highly structured data
([see how it renders on xod.io](https://xod.io/docs/reference/supported-hardware/))
which would be hard to maintain using plain Markdown/HTML.

In such cases, a [YAML](https://en.wikipedia.org/wiki/YAML) file to hold the
data can be created. The structured object described in it is available to the
Markdown source with a little template magic:

```html
{{#each index}}
<h2>{{ section }}</h2>
  {{#each parts}}
  <div>
    {{ part }} {{ kind }} {{#if vendor}}by {{ vendor }}{{/if}}.
  </div>
  {{/each}}
{{/each}}
```

Note the `{{ xxx }}` placeholders. They are
[Handlebars](https://handlebarsjs.com/) template tags. Any `.yaml` file put next
to `README.md` is available by its basename for templating (`index` for
[`index.yaml`](./docs/reference/supported-hardware/index.yaml) in the example
above).

## Markdown formatting

To keep all source files consistent and easy to maintain several formatting
rules apply. Notably, all Markdown files should be word-wrapped to be no wider
than 80 characters.

Instead of describing all the rules and checking them on review, they are
enforced automatically using [Prettier](https://prettier.io/). If you have done
a significant portion of work, run `yarn prettier` to format your Markdown
correctly.

### Front matter

One thing you’ll see in Markdown sources is a block at the very top fenced with
`---`. This is metadata used by the site engine:

```
---
title: Hello World
version: 1.2.3
---
```

The `title` field is passed to a browser to render the page’s `<title/>`.

The `version` is a [semver](https://semver.org/) of the current page content
used to understand whether a translation lags behind the master version or not.
An increment in the patch part (`3`) denotes typo fixes and wording improvements
which require no translation updates. A bump of minor part (`2`) denotes
additions and refinements which are desirable to see in translated versions. A
change in the major part (`1`) denotes a total rewrite. If the `version` field
is absent, it is implied to be `1.0.0`.

## Maintenance

```bash
$ yarn prettier:all
# Format *all* Markdown in the repo

$ yarn prettier README.md CONTRIBUTING.md
# Format only files specified

$ yarn prettier-check:all
# Dry-check all Markdown in the repo
```

## License

All content is available under a Creative Commons license.

## How to contribute

Any help with fixing the grammar, translating, resolving ambiguities, adding
references, and general improvement is much appreciated. Refer to
[CONTRIBUTING.md](./CONTRIBUTING.md) to learn how.
