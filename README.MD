## A simple json mapping for the SGM server listing.
https://www.seriousgmod.com

## Installation
This goes into your `shard.yml`

```yaml
dependencies:
  sgm-binding:
    github: PixeLInc/SGM-Binding
```

## Usage
```crystal
require "sgm-binding"

SGM.servers # => Array(Server)

SGM.servers SGM::ServerType::Terrortown # => Array(Server) of ServerType Specified
```

## Contributors
- [PixeLInc](https://github.com/PixeLInc) - creator, maintainer
