# Raven.js

This is a simple sprockets wrapper around raven-js.

## Gem

### Installation

Add this line to your application's Gemfile:

    gem 'raven-js'

And then execute:

    $ bundle

### Usage

```ruby
# Assuming you have an existing Sprockets environment assigned to `assets`
RavenJS::Sprockets.setup(assets)
```

```javascript
//= require raven
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
