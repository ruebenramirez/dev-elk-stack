test-elk-stack
==============

run the containers
------------------

Start by getting the containers running
```
./1-init-elk-docker.sh
```

We might have to login to the kibana box and startup supervisord ourselves.  
There's something funky going on with the config right now.  This is a dev 
stack, so no need to chase down the quirkiness right now.

load data
---------
Then, let's load up some data:
```
./2-load-up-som-data.sh
```


