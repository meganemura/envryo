# Envryo

[![Gem Version](https://img.shields.io/gem/v/envryo.svg)](http://badge.fury.io/rb/envryo)
[![Code Climate](https://img.shields.io/codeclimate/github/meganemura/envryo.svg)](https://codeclimate.com/github/meganemura/envryo)
[![Dependency Status](https://gemnasium.com/meganemura/envryo.svg)](https://gemnasium.com/meganemura/envryo)

Evernote various events notifier via Yo.

## Usage

1. Invoke it with config

    `envryo --config=config.yml`

2. Update evernote note

3. Envryo yo to you or all

## Configuration (config.yml)

```yaml
evernote_token:  "Your evernote authentication token"
evernote_filter: "tag:notify"    # Search filter
                                 # https://dev.evernote.com/doc/articles/search_grammar.php

yo_api_key:      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
yo_user:         "Yo username"   # Send Yo to (set null to send Yo to all subscribers)

interval:        900             # polling interval
```

## Installation

Add this line to your application's Gemfile:

    gem 'envryo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install envryo

## Contributing

1. Fork it ( https://github.com/meganemura/envryo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
