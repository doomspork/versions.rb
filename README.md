# Versions.rb [![Build Status](https://travis-ci.org/doomspork/versions.rb.png?branch=version-0-1-1)](https://travis-ci.org/doomspork/versions.rb)

_"Ruby class versioning made simple."_

Latest version: __0.1.1__

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
