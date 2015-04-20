# Versions.rb

_"Ruby class versioning made simple."_

[![Gem Version](https://badge.fury.io/rb/versions.rb.png)](https://rubygems.org/gems/versions.rb) [![Build Status](https://travis-ci.org/doomspork/versions.rb.png?branch=master)](https://travis-ci.org/doomspork/versions.rb) [![Code Climate](https://codeclimate.com/github/doomspork/versions.rb.png)](https://codeclimate.com/github/doomspork/versions.rb) [![Coverage Status](https://coveralls.io/repos/doomspork/versions.rb/badge.png?branch=master)](https://coveralls.io/r/doomspork/versions.rb)

Ruby 1.9, 2.0, 2.1, and JRuby supported.

## Quickstart

Install it:

`gem install versions.rb`

Create a version (`lib/v1.0/awesome_feature.rb`):

```ruby
module V1_0
  class AwesomeFeature
    def foo
      :bar
    end
  end
end
```

Use it:

```ruby
VersionedFeature = Versions.for(:awesome_feature).select('1.0')
feature          = VersionedFeature.new
```

## Configuration

#### File locations
By default Versions.rb will try to use a `lib/` directory within the project root, you can override this:

```ruby
Versions.config.base_dir = 'dir_path_of_your_choosing'
```

Alternatively you can override the `base_dir` for a single call as such:

```ruby
Versions.for(:awesome_feature).at('./other/location').select('1.0')
```

## Contributing

Please make appropriate use of [Issues][issues] and [Pull Requests][pr]. All code should have accompanying tests.

## Author/Contact

Versions.rb is written and maintained by [@doomspork](https://github.com/doomspork)

## License

Versions.rb is made available under the [MIT][mit] license.

[issues]: https://github.com/doomspork/versions.rb/issues
[pr]: https://github.com/doomspork/versions.rb/pulls
[mit]: LICENSE
