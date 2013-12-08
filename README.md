step-capifony
=============

A wercker step to execute a `capifony` task. The step has support for multiple stages.

More information:
- http://capifony.org

[![wercker status](https://app.wercker.com/status/d8ad79ec7c74eb5e2ea461a97fd08979/m "wercker status")](https://app.wercker.com/project/bykey/d8ad79ec7c74eb5e2ea461a97fd08979)

# Options

* `tasks` (optional, default: `deploy`) The tasks which will be run.
* `stage` (optional) The stage which will be used for the deployment. Requires [multistage extension](http://capifony.org/cookbook/using-the-multistage-extension.html).

# Example

``` yaml
deploy:
  steps:
    - eymengunay/capifony@0.0.5
```

Note however that this will also apply to your local repository, so another recommendation is to use [multistage extension](http://capifony.org/cookbook/using-the-multistage-extension.html) and use a seperate stage for wercker deployment.

# License

The MIT License (MIT)