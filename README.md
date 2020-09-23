# Driving school back-end application

Compatible libraries version

- Rails 6.0.3
- Ruby 2.7.1

## How to run development environment

1. You need simply run `docker-compose up`
   Docker compress will mount this project folder to docker volume. So you may see some files get updated in your local environments.
2. Access to `http://localhost:3000`

## OpenID connect

### How to create OAuth application

1. Visit OAuth application url: http://localhost:3000/operator/oauth/applications
2. Create new application

If you need to test OAuth implicit workflow

1. Enter OAuth application 
2. Copy link from "Authorize" button
3. Change from response_type=code to response_type=token
4. Access to that url
5. You will redirected to your callback url and you will access_token parameter in the url

## Test users

User name: student@example.com
Password: !QAZ2wsx
User name: teacher@example.com
Password: !QAZ2wsx

## About API document

TODO: To use swagger for API documentation
