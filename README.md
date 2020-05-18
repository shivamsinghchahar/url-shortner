# URL Shortener

## Setup

1. Clone the repository by running the following command

```sh
$ git clone git@github.com:chaharshivam/url-shortner.git
```

2. Now, go to the cloned directory
```sh
$ cd url-shortner
```

3. Install dependencies by running the following commands
```sh
$ yarn install --check-files
$ bundle i
```

4. Setup the database
```sh
$ rails db:create db:migrate db:setup
```

5. Now create a `env` file with `ROOT_URL`
```sh
$ touch .env
$ echo "ROOT_URL=http://localhost:3000" > .env
```

6. Now we can run the rake tasks as follows
```sh
$ URL=https://bigbinary.com/jobs bundle exec rake app:encode

$ SHORTURL=https://short.is/tkLo2367 bundle exec rake app:decode 
```

## Assignment 2 - Reactify App

>App is deployed [here](https://url-shortner-chaharshivam.herokuapp.com/)

### Design
- `urls` table should have a boolean field `pinned` with a default value of `false`
- The urls returned at `index` action are in the following order:
  - Pinned urls in chronological order i.e. The latest pinned url is at the top
  - Non-Pinned urls in chronological order but after the pinned urls

### API
```yaml
index:
  method: 'GET'
  path: '/'
  responses:
    200: Returns a list of urls
    404: Not Found
    422: Unprocessable Entity

create:
  method: 'POST'
  path: '/urls'
  parameters:
    url:
      original: 'original url e.g. https://bigbinary.com'
  responses:
    200: Returns the url with shortened link
    422: Unprocessable Entity

show:
  method: 'GET'
  path: '/urls/:slug'
  parameters:
    slug: unique slug
  responses:
    200: Returns the url object with original url
    404: Not Found

update:
  method: 'PUT'
  path: '/urls/:slug'
  parameters:
    slug: unique slug
    url:
      pinned: 'true/false'
  responses:
    200: Returns the updated url
    404: Not Found
    422: Unprocessable Entity
  
```