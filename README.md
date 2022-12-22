# QuickOpenAI

This gem is a wrapper of [ruby-openai](https://github.com/alexrudall/ruby-openai), providing quick convenience methods for experimenting with OpenAI language and image models.

## Usage

Quickly get results from GPT3:

```ruby
puts "Hello, what is your name?".gpt3
# => My name is Aileen.
```

Quickly get images from DALLE2:

```ruby
"a drawing of a cat in a hat".dalle2.then { |tempfile|
  File.open('./cat.png', 'wb') { |f| f.puts tempfile.read }
}
```
<img src="https://raw.githubusercontent.com/Aesthetikx/quick_openai/master/.github/cat.png" height=256 width=256></img>

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add quick_openai

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install quick_openai

## Setup

Make sure you have your OpenAI access token in ENV, and then require QuickOpenAI to include String extensions.
```ruby
ENV['OPENAI_ACCESS_TOKEN'] = '12345'

require 'quick_openai'
```

## Options

You can pass options supported by `ruby-openai` to the convenience methods:

```ruby
"a drawing of a cat in a hat".dalle2(n: 2) # => An array of two tempfiles

"count to ten in italian".gpt3(model: 'text-ada-001') # Use a different model

"write me an essay on napoleon".gpt3(max_tokens: 2048) # Produce more output
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aesthetikx/quick_openai.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
