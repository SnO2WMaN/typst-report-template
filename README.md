# My Typst Template

[![Deploy status](https://github.com/SnO2WMaN/typst-report-template/actions/workflows/deploy.yml/badge.svg)](https://github.com/SnO2WMaN/typst-report-template/actions/workflows/deploy.yml)

My [Typst](https://typst.app) document template.

## Features

- Build document in **GitHub Actions** and deploy to **GitHub Pages**.

## Example

https://sno2wman.github.io/typst-report-template/main.pdf

## Customize

### Fonts

You can every fonts in [Fontsource](https://fontsource.org) ([Google Fonts](https://fonts.google.com)).

```yaml
- name: Install "Shippori Mincho B1"
  uses: SnO2WMaN/install-fontsource-action@v0.0.1
  with:
    font-name: Shippori Mincho B1
```

## License

[CC BY 4.0](./LICENSE)
