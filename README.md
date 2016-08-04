# CampHunt

A web application for tracking and organizing your camping trips. Built with
Ruby on Rails.

## Setup Instructions

To get started you will first have to visit the [Active developer
page](http://developer.active.com/) and set up a developer account. Once you
have received your Active api key you can add it to your `secrets.yml` file.

`active_api_key: <Your Active API Key>`

And then execute:

    $ bundle install

## Usage

Once you have everything setup you can login either with a email and password or
via Twitter. With CampHunt you will be able to search for thousands of parks
throughout the United States via Active's API. Once you select a park to visit
you can save it with a name, description, start and end dates, and a list of
supplies with quantity. Your homepage will also display upcoming trips within
the next 30 days.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Smulligan85/CampHunt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/Smulligan85/CampHunt )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

