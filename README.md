## Danger

[Danger](http://danger.systems) runs during Mongoid projects' CI process, and gives you a chance to automate common code review chores.

[![Build Status](https://travis-ci.org/mongoid/danger.svg?branch=master)](https://travis-ci.org/mongoid/danger)

### Setup

Enable Danger for a project within the [mongoid organization](https://github.com/mongoid).

#### Set DANGER_GITHUB_API_TOKEN in Travis-CI

In Travis-CI, choose _Settings_ and add `DANGER_GITHUB_API_TOKEN` in _Environment Variables_. Tick the _Display value in build log_ option to enable Danger in pull requests. Set the value to the API key for the [mongoid-bot](https://github.com/mongoid-bot) user, look in a recent build for this project for its value.

#### Add Danger

Add `danger` to `Gemfile`.

```ruby
gem 'danger', '~> 3.0'
```

#### Add Dangerfile

Commit a `Dangerfile` with some placeholder text, eg. [mongoid-compatibility's Dangerfile](https://github.com/mongoid/mongoid-compatibility/blob/master/Dangerfile). Danger automatically inherits the [Dangerfile](Dangerfile) in the organization's `danger` repo (this repo).

#### Add Danger to Travis-CI

Add Danger to `.travis.yml`, eg. [mongoid-compatibility's Travis.yml](https://github.com/mongoid/mongoid-compatibility/blob/master/.travis.yml).

```yaml
matrix:
  include:
    - rvm: 2.3.0
      script:
        - bundle exec danger
```

#### Commit via a Pull Request

To test things out, make a dummy entry in `CHANGELOG.md` that doesn't match the standard format and make a pull request. Iterate until green.

## License

MIT License. See [LICENSE](LICENSE) for details.

