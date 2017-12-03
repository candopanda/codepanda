# Codepanda

[![Build Status](https://semaphoreci.com/api/v1/vladimirmikhailov/codepanda/branches/master/badge.svg)](https://semaphoreci.com/vladimirmikhailov/codepanda)

A simple gRPC based lib for executing arbitrary C lang code.

## Installation

* Add to Gemfile

```
gem 'codepanda',
  git: 'https://github.com/candopanda/codepanda.git,
  require: 'codepanda/client'
```

## Usage

Consider the following example when you need to execute some arbitrary
C code in safe environment:

```
source_code = <<-C_LANG
  #include <stdio.h>
  int main()
  {
    printf("Hello, World!");
    return 0;
  }
C_LANG

Codepanda::Client.new.execute(source_code)
```

> Please note that `Codepange::Client.new` establishes a new connection
> and consider to use it in a pair with
> (connection_pool)[https://github.com/mperham/connection_pool]

## Configuration

Please use `CODEPANDA_PORT` env variable (default: 50051) to setup server listening port.
And the `CODEPANDA_SERVER_URL` to set server address where client should
connect to (default: `localhost:50051`).


## Roadmap

* Add LB and run multiple servers and pick server by a distribution
  protocol
* Add better failure error explanation
