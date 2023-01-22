# Next release - Github Action

This action calculate which is the next version and the changelog for the next release using conventional commits. Internally it uses
[convco](https://convco.github.io/).

## Inputs

### `tag-prefix`

**Optional** TPrefix used in front of the semantic version. Default `"v"`.

### `paths`

**Optional**Only commits that update those <paths> will be taken into account. It is useful to support monorepo. Default `"."`.

## Outputs

### `current-version`

Current version.

### `current-version-tag`

Current version tag.

### `next-version`

Next version.

### `next-version-tag`

Tag version tag.

### `current-version`

Changelog from current version.

## Example usage

```yaml
name: build_release
on:
  push:
    branches: 
      - main
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: actions/next-release@v1
        id: next
      - name: Create Release
        uses: ncipollo/release-action@v1
        with:
          tag: ${{ steps.next.outputs.next-version-tag }}
          name: 'App ${{ steps.next.outputs.next-version }}'
          body: ${{ steps.next.outputs.changelog }}
          token: ${{ github.token }}
```