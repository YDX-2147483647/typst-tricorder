# Contributing guide

## First-time setup

1. Install [typst](https://github.com/typst/typst/releases), [tytanic](https://tingerrr.github.io/tytanic/quickstart/install.html), and [just](https://just.systems/man/en/).
2. Clone this repo.
3. Run `just setup` to download fonts into [`fonts/`](./fonts/).

## Development

1. Edit [`src/`](./src/).
2. Create new tests by `just --command tt new <NAME>`.
3. Run `just test`.
4. If you want to clean the repo, run `git clean -dx --interactive`.

## For repo owners

To use [the release workflow](./.github/workflows/release.yml):

1. [Create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_REPO`.
2. Save it to the secret `REGISTRY_TOKEN` of this repo.
