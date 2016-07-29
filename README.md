# A 'RESTful' API

An attempt to create a (mostly\*) REST-compliant API, based on Rack.

\* Level 3 in the [Richardson Maturity Model](http://martinfowler.com/articles/richardsonMaturityModel.html)

## Motivation

Rails is great for creating websites fast. It's not so good at letting you
construct something that goes against it's conventions. I want something that
uses 'Convention over Configuration' but applies it to RESTful APIs.

## Requirements

- Correct handling of HTTP verbs
- Rails-style handling of resources
- [Correct handling of errors](#error-handling) (Response format based on
  `Accept` header with correct `Content-Type` header)
- [Content negotiation by default](#content-negotiation) (via Accept header)
- [Discoverability (HATEOAS)](#hateoas)

### <a name='error-handling'></a>Error Handling

By default, Rails will return a HTML error page regardless of what format is
requested. It's easy to add handling for specific formats but this must be
explicit in the relevant controller. Returning an error page or 404 response in
the correct format should be the default and not require explicit action.

This isn't explicitly stated as a requirement of REST but comes under Content
Negotiation and worth pointing out separately.

This is beneficial for clients because they are handling the response type they
asked for rather than trying to parse HTML as JSON (for example).

### <a name='content-negotiation'></a>Content Negotiation

Content Negotiation is one of the requirements for full REST-compliance. This
should include the standard handling which Rails provides, i.e JSON/XML
responses based on the `Accept` header, but go further to specify version
information.

For example, sending an `Accept` header of `application/vnd.example.api+json;version=2`
would return a JSON representation of the second version of the endpoint.
The `vnd.` prefix is proposed in [RFC4288](https://tools.ietf.org/html/rfc4288#section-3.2)
for the purpose of distinguishing between standard and customer content types.

If an `Accept` header's format can not be handled, a `406 Not Acceptable` should
be returned. Rails handles this with a routing error and a `404` which is not
'technically' correct.

Allowing the client to choose the response type and version it wants it useful.
For example, this allows you to decouple deploying breaking changes to an API
from the equivalent change required in the client.

### <a name='hateoas'></a>Discoverability (HATEOAS)

If you visited a standard HTML website and there we no links to other parts of
the site (which you knew existed), you'd think something was amiss.
Unfortunately, most people do not apply the same standard to APIs. The result of
this is that, to use an API with no prior knowledge, there has to be up to date
documentation; this is rarely the case.

There are a number of specifications to achieve this:
[HAL](http://stateless.co/hal_specification.html),
[JSON API](http://jsonapi.org/), [JSON-LD](http://json-ld.org/) and
more. The [Github API](https://developer.github.com/v3/) doesn't conform to any
of these but still provides good discoverability by providing links to related
resources.

Allowing the server to guide the client to relevant resources means that the
server can be more easily modified and well-behaved clients will still work
correctly.

