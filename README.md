# BlanketyBlank

## Conundrum:

Pesky empty strings getting into your database? It makes querying and reporting a hassle, and no one wants that.

## Solution:

This gem.

BlanketyBlank sets designated blank values on ActiveRecord models to `nil` before validation. Simple, no black boxes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blankety_blank'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blankety_blank

## Usage

Designate attributes with `nilify_before_validation`. If using STI, do this on your base class.

```ruby
class Company < ActiveRecord::Base
  include BlanketyBlank
  nilify_before_validation :name, :phone
end

class Vendor < Company; end

vendor = Vendor.new(name: "Foo", phone: " ")
vendor.validate
vendor.name   # "Foo"
vendor.phone  # nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/uberllama/blankety_blank.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

