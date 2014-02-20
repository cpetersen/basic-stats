# Basic::Stats
[![Build Status](https://secure.travis-ci.org/cpetersen/basic-stats.png)](http://travis-ci.org/cpetersen/basic-stats)
[![Code Climate](https://codeclimate.com/github/cpetersen/basic-stats.png)](https://codeclimate.com/github/cpetersen/basic-stats)
[![Gem Version](https://badge.fury.io/rb/basic-stats.png)](http://badge.fury.io/rb/basic-stats)

Basic statistical functions for Ruby collections, such as mean, standard_deviation, z, and outlier detection

## Installation

Add this line to your application's Gemfile:

    gem 'basic-stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install basic-stats

If you aren't using rails, you may have to require the ```basic/stats``` file.

    require 'basic/stats'

## Usage

To use basic stat's methods, include the module in your array

```ruby
  array = [1,2,3,4,5,6,7,8,9,10]
  array.extend Basic::Stats
  array.mean
  array.standard_deviation
  array.critical_z
  array.z(5)
```

Once you've included the module, you can also use outlier detection

```ruby
  array = [1,2,3,4,5,6,7,8,9,30]
  array.extend Basic::Stats
  array.select_outliers
  array.reject_outliers
  array.reject_outliers!  
```

## Notes on outlier detection

```basic-stats``` uses the [Grubb's test](http://en.wikipedia.org/wiki/Grubbs'_test_for_outliers) for outlier detection. Specically it assumes an alpha of 5%, meaning you will mistakenly identify an outlier in 5% of your samples. More information [here](http://graphpad.com/support/faqid/1598/).

The Grubb's test does not work well for detecting multiple outliers.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make your changes
4. Make sure the specs run (`bundle exec rake spec`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
