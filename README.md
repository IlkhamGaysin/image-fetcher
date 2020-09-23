# ImageDownloader

[![IlkhamGaysin](https://circleci.com/gh/IlkhamGaysin/image-downloader.svg?style=svg)](https://circleci.com/gh/IlkhamGaysin/image-downloader)
[![Maintainability](https://api.codeclimate.com/v1/badges/d525377e85ead82c4ad5/maintainability)](https://codeclimate.com/github/IlkhamGaysin/image-downloader/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d525377e85ead82c4ad5/test_coverage)](https://codeclimate.com/github/IlkhamGaysin/image-downloader/test_coverage)

This gem allows you download images from either source file with list of urls or plain url.
The urls must be non redirectable. For now the feature is unsupported. The gem uses `OpenURI` class under the hood and is able to download as small files less than 10KB as large files 100MB.

## Dependencies
  - Ruby >= 2.7.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image-downloader'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install image-downloader

## Usage

The gem is provided with executable.

You can either run plain commmand with file containing list of url:

```bash
image-downloader <path_to_file>
```

Or you can load gem and use public API:

- `ImageDownloader.from_file` - allows download images from file containing urls

```ruby
[1] pry(main)> require 'image_downloader'

[2] pry(main)> path = File.expand_path("./urls.txt")

[3] pry(main)> ImageDownloader.from_file(path)
Downloading https://test-for-image-downloader.s3.eu-central-1.amazonaws.com/7.5MB.jpg
Downloading is finished
Downloading https://test-for-image-downloader.s3.eu-central-1.amazonaws.com/less_than_10kb.png
Downloading is finished
```

- `ImageDownloader.from_url` - allows download image from url

```ruby
[1] pry(main)> require 'image_downloader'

[2] pry(main)> url = 'https://test-for-image-downloader.s3.eu-central-1.amazonaws.com/7.5MB.jpg'

[3] pry(main)> ImageDownloader.from_url(url)
Downloading https://test-for-image-downloader.s3.eu-central-1.amazonaws.com/7.5MB.jpg
Downloading is finished
```

You can also configure the place where the images would be stored to by using **by default the images stored in a directory the script is run**:

```ruby
[1] pry(main)> require 'image_downloader'

[2] pry(main)> ImageDownloader::Configuration.configure do  |config|
[2] pry(main)*   config.destination = "./tmp/"
[2] pry(main)* end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/IlkhamGaysin/image-downloader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/IlkhamGaysin/image-downloader/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ImageDownloader project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/IlkhamGaysin/image-downloader/blob/master/CODE_OF_CONDUCT.md).
