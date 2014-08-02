# Envryo

Evernote various notifier via Yo.

## Usage

1. Invoke it with config

    `envryo --config=config.yml`

2. Update evernote note

3. Envryo yo to you or all

## Configuration (config.yml)

```yaml
evernote_token: "Your evernote token"
yo_api_key:     "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
yo_user:        "Yo username"   # Set null to yo all
interval:       300
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
