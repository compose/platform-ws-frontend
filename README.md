Platform Work Sample (Frontend)
===============================

The contained project serves as the frontend/UI layer of the Platform Engineering work sample.

### Things to know:

* This project relies on your having the [platform-ws-services](https://github.com/compose/platform-ws-services) project up and running.
* Database for this project is purely mocked hashes.  We chose this to limit the additional steps required to get started.
* We use slim for building well formed HTML: http://slim-lang.com/

### Deploying with Vagrant

To ease your deployment needs we have provided a Vagrantfile. To deploy your application, simply run `vagrant up`. This will boot a VM at the ip `10.0.32.5` which installs all dependencies you need and launches the rails app. Note: If you want to setup any environment variables, simply export them in the `setup-env.sh` script and they will be visible from the VM. This directory is synced with the VM, so you shouldn't need to do anything to the project after editing for changes to have effect. However, if you want to completely refresh the project, a `vagrant provision` will rerun `bundle install`, reconfigure the environment variables, and restart the rails app.

The app will be available at http://10.0.32.5:3000

Note: The Vagrantfile requires Vagrant 1.5 or newer

### Models

While the model relationship in this example is degraded to a basic
stub, think of it this way:

* Accounts have many deployments
* Deployment has many capsules

##Work Sample

* Add the necessary functionality to consume the Alerts for a deployment.
* After retreiving the alerts, design and format the alerts for customers to view.  For information on formatting posibilities, see: http://megatron-docs.herokuapp.com/

***HINTS:***

* Make sure you look back at the https://github.com/compose/platform-ws-services for the alert service
* If you are unfamiliar with Ruby HTTP clients, take a look at `restclient` for ease of use.
