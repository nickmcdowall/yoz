
# From the yo root directory use rebar to compile the application.
./rebar get-deps compile

# Start the application locally
erl -pa ebin deps/*/ebin -s yo

# Verify that yo is running:
application:which_applications().

# Use the app
http://localhost:8080


Resources:

# Setup an Erlang app on Heroku
http://roberto-aloi.com/blog/2013/07/13/create-deploy-erlang-cowboy-application-heroku/
