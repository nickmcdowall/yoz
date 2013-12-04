
======================
Building and Deploying
======================

# Compile the app from the root directory
./compile.sh

# Run the app locally: http://localhost:8080
./start_app.sh

# Verify that yoz is running from the Erlang shell:
application:which_applications().

# Deploy to Heroku at: http://yoz.herokuapp.com/ 
./deploy.sh

=================
Useful Resources:
=================

# Setup an Erlang app on Heroku
http://roberto-aloi.com/blog/2013/07/13/create-deploy-erlang-cowboy-application-heroku/
