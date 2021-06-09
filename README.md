# TeaBox

## About this Project
TeaBox is a backend Rails API which exposes endpoints for a hypothetical frontend app, allowing creation, cancellation, and viewing of customer tea subscriptions.

## Table of Contents

- [Getting Started](#getting-started)
- [Running the tests](#running-the-tests)
- [Built With](#built-with)
- [Authors](#authors)


## Getting Started

To get the web application running, please fork and clone down the repo.

`git clone <your@github.account:SweaterWhether.git>`

### Prerequisites

To run this application you will need Ruby 2.5.3 and Rails 5.2.5

### Installing
- `rails db:{create,migrate}
- Install the gem packages  
  - `bundle install`
- Initialize RSpec
  - `rails generate rspec:install`

## Running the tests
RSpec testing suite is utilized for testing this application.
- Run the RSpec suite to ensure everything is passing as expected  
`bundle exec rspec`

## Endpoints

##### Create Subscription
- **Required** query params:
  - `user_id`
  - `tea_id`
  - `frequency`

`POST /api/v1/subscriptions?user_id={id}&tea_id={id}&frequency={shipments per period}"`

```json
{
  "data": {
     "id": "42",
     "type": "subscription",
     "attributes": {
       "status": "active", 
       "frequency": 6, 
       "pricepoint": 120
     },
     "relationships": {
       "customer": {
         "data": {
           "id": "49",
           "type": "customer"
         }
       },
       "tea": {
         "data": {
           "id": "58", 
           "type": "tea"
         }
       }
     }
   }
 }
```

##### Cancel Subscription
- **Required** query params:
  - `subscription_id`

`PATCH /api/v1/subscriptions/{subscription_id}`

```json
{
  "data": {
    "id": "43",
    "type": "subscription",
    "attributes": {
      "status": "inactive",
      "frequency": 4,
      "pricepoint": 30
    },
    "relationships": {
      "customer": {
        "data": {
          "id": "50",
          "type": "customer"
        }
      },
      "tea": {
        "data": {
          "id": "59",
          "type": "tea"
        }
      }
    }
  }
}
```

##### Fetch All Subscriptions - Active and Inactive
- **Required** query params:
  - `customer_id`


`GET /api/v1/subscriptions?customer_id={customer_id}`

```json
{
  "data": [
    { 
      "id": "47",
       "type": "subscription",
       "attributes": {
        "status": "active",
        "frequency": 3, 
        "pricepoint" :50
      },
      "relationships":{ 
        "customer": {
          "data": {
            "id": "53", 
            "type": "customer"
          }
        },
        "tea": {
          "data":{
            "id": "63",
            "type": "tea"
          }
        }
      }
    },
    {
      "id": "48",
      "type": "subscription",
      "attributes": {
        "status": "inactive",
        "frequency": 6, "pricepoint": 20
      },
      "relationships": {
        "customer": {
          "data": {
            "id": "53",
            "type": "customer"
          }
        }, 
        "tea ": {
          "data": {
            "id": "64",
            "type": "tea"
          }
        }
      }
    }
  ]
}
```


## Built With

- [Ruby](https://www.ruby-lang.org/en/)
- [RSpec](https://github.com/rspec/rspec)
- [Rbenv](https://github.com/rbenv/rbenv)


## Versioning
- Rails 5.2.5
- Ruby 2.5.3
- RSpec 3.10.0
- Rbev 1.1.2

## Author

- **Wil McCauley**
|    [GitHub](https://github.com/wil-mcc) |
    [LinkedIn](https://www.linkedin.com/in/wil-mccauley/)
    
