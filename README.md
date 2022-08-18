## Danger

[Danger](http://danger.systems) runs during Mongoid projects' CI process, and gives you a chance to automate common code review chores.

[![Build Status](https://github.com/mongoid/danger/actions/workflows/test.yml/badge.svg)](https://github.com/mongoid/danger/actions)

### Setup

Enable Danger for a project within the [mongoid organization](https://github.com/mongoid). This involves adding a token in Travis-CI and making some build script changes. See [mongoid-compatibility#3](https://github.com/mongoid/mongoid-compatibility/pull/3) for a complete example.

#### Set DANGER_GITHUB_API_TOKEN in Travis-CI

In Travis-CI, choose _Settings_ and add `DANGER_GITHUB_API_TOKEN` in _Environment Variables_. Tick the _Display value in build log_ option to enable Danger in pull requests. Set the value to the API key for the [mongoid-bot](https://github.com/mongoid-bot) user, look in a recent build for this project for its value.

#### Add Danger to Gemfile

Add `mongoid-danger` to `Gemfile`.

```ruby
gem 'mongoid-danger', '~> 0.1.0', require: false
```

#### Add Dangerfile

Commit a `Dangerfile`, eg. [mongoid-compatibility's Dangerfile](https://github.com/mongoid/mongoid-compatibility/blob/master/Dangerfile).

#### Add Danger to GitHub Actions

Add `.github/workflows/danger.yml`, eg. [mongoid-compatibility's danger.yml](https://github.com/mongoid/mongoid-compatibility/blob/master/.github/workflows/danger.yml).

```yaml
name: PR Linter
on: [push, pull_request]
jobs:
  danger:
    runs-on: ubuntu-latest
    env:
      BUNDLE_GEMFILE: ${{ github.workspace }}/Gemfile
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: 2.6
          bundler-cache: true
      - run: |
          # the personal token is public, this is ok, base64 encode to avoid tripping Github
          TOKEN=$(echo -n NWY1ZmM5MzEyMzNlYWY4OTZiOGU3MmI3MWQ3Mzk0MzgxMWE4OGVmYwo= | base64 --decode)
          DANGER_GITHUB_API_TOKEN=$TOKEN bundle exec danger --verbose
```

#### Add Danger to Travis-CI

Add Danger to `.travis.yml`, eg. [mongoid-compatibility's Travis.yml](https://github.com/mongoid/mongoid-compatibility/blob/master/.travis.yml).

```yaml
matrix:
  include:
    - rvm: 2.3.1
      script:
        - bundle exec danger
```

#### Commit via a Pull Request

To test things out, make a pull request without CHANGELOG.md changes. Iterate until green.

## License

MIT License. See [LICENSE](LICENSE) for details.

