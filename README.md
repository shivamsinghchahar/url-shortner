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