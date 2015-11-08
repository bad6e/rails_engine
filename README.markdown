## Rails Engine
### The Sales Engine Redux

In this project, I used Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema.

The learning goals of this project were as follows:

## <a name="learning-goals"></a> Learning Goals

* Learn how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
* Learn how to use controller tests to drive your design.
* Use Ruby and ActiveRecord to perform more complicated business intelligence.

## <a name="technical-expectations"></a> Technical Expectations

* All endpoints will expect to return JSON data
* All endpoints should be exposed under an `api` and version (`v1`)
namespace (e.g. `/api/v1/merchants.json`)
* JSON responses should included `ids` only for associated records unless otherwise indicated (that is, don't embed the whole associated record, just the id)
* Prices are in cents, therefore you will need to transform them in dollars. (`12345` becomes `123.45`)
* Remember that for a JSON string to be valid, it needs to contain a key and a value.

### Data Importing

* You will create an ActiveRecord model for each
entity included in the [sales engine data](https://github.com/turingschool/sales_engine/tree/master/data).
* Your application should include a rake task which imports all of the CSV's and creates the corresponding records.


The original project guideline can be found here:

[Turing School Original Assignment - Rails Engine](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)

