Platform Work Sample (Frontend)
===============================

The contained project serves as the frontend/UI layer of the Platform Engineering work sample.

### Things to know:

* This project relies on your having the [platform-ws-services](https://github.com/compose/platform-ws-services) project up and running.
* Database for this project is purely mocked hashes.  We chose this to limit the additional steps required to get started.
* We use slim for building well formed HTML: http://slim-lang.com/

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
