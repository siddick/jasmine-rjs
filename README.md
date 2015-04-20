# Jasmine + Require.js + Karma

Rails plugin to integrate Jasmine, Require.js and Karma.

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'jasmine-rjs', group: [:development, :test]         # Jasmine testing
gem 'requirejs-rails'                                   # For helper methods and rake tasks
```

And then execute:

```bash
rails g jasmine:install                         # Install default jasmine configuration
npm install karma karma-cli \
            karma-jasmine karma-requirejs \
            karma-phantomjs-launcher -g         # To test with karma
```

## Usage

To start karma watcher:

```bash
rake jasmine:karma
```

To test from cli:

```bash
rake jasmine:ci
```

## Configuration

To override karma configuration, create file `karma.conf.js`:

```javascript
module.exports = function(config) {
   config.set({
       logLevel: config.LOG_INFO,
       browsers: ['Chrome', 'PhantomJS']
   });
};
```

## Contributing

1. Fork it ( https://github.com/siddick/jasmine-rjs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
