# Versions.rb

_"Ruby class versioning made simple."_

[![Gem Version](https://badge.fury.io/rb/versions.rb.png)](https://rubygems.org/gems/versions.rb) [![Build Status](https://travis-ci.org/doomspork/versions.rb.png?branch=master)](https://travis-ci.org/doomspork/versions.rb) [![Code Climate](https://codeclimate.com/github/doomspork/versions.rb.png)](https://codeclimate.com/github/doomspork/versions.rb) [![Coverage Status](https://coveralls.io/repos/doomspork/versions.rb/badge.png?branch=master)](https://coveralls.io/r/doomspork/versions.rb)

## Quickstart

Install it:

`gem install versions.rb`

Create a version (`lib/awesome_feature/v1.0.rb`):

```ruby
module AwesomeFeature
  class V1_0
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

Please feel free to make use of [Issues][issues] and [Pull Requests][pr], all code must have accompanying specs.

## Author/Contact

Versions.rb is written and maintained by Spork (iamdoomspork@gmail.com).

## License

Versions.rb is made available under the [MIT][mit] license.

[issues]: https://github.com/doomspork/versions.rb/issues
[pr]: https://github.com/doomspork/versions.rb/pulls
[mit]: LICENSE
