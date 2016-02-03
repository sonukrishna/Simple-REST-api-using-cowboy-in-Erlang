# Simple-REST-api-using-cowboy-in-Erlang
 Two erlang programs to understand how to open a REST api. The first one is give some idea about GET and POST methods, second is a simple rest_hello_world program.

### rebar3
  I created these apps using rebar3, previously i used the rebar to did the calendar_server.
  -----> rebar3 new app rest2 ===> 
  a new folder rest2 is created with the following file LICENSE,README.md,rebar.config,rest2rel,src(rest2.app.src, rest2_app.erl, rest2_sup.erl),
  Now add dependency to the rest2.app.src(adding cowboy), we can sets up any coinfiguration we want like database, any nodes etc.

  --Then change the rest2_app.erl, which is the entry point into our application. Now define the root of theREST api, 
  and the function rest2_handler(created in src), which tell what erl file is load for this controller.use the function   --> cowboy_router:compile([{}]).

  --Now set the http server using --> cowboy:http_start().

  Then the supervisor behaviour, we didn't touch it. Rebar3 by default set the supervisor module.

  Created the rest2_handler, which contain some erlang code to the controller.
-------> Now compiled using rebar3 compile 

-------> Then created a release --> rebar3 new release rest2rel ==> form a rest2rel directory. call the release from here
        ---> rebar3 release
        and then to the console by
            --->    ./_build/default/rel/restrel/bin/restrel console
            Which opens the console and u can now run http://localhost:Port or more advanced way is using the Advanced REST client
           
This is the way of using rebar3
          

####  rest_handlers
    It is a really basic example to create a rest api, the hello world! example.
    The rest2_handler, returns the hello world as output in both text and json format.
    By calling the function content_types_provided, pass the content types(json, text etc). And returns the hello world
    in respective formats using the functions(hello_to_json, hello_to_text etc). And also the init and the terminate
    functions for startup the function each time someone involks the end points and to terminate if the behaviour 
    is terminated, respectevely.
    The rest1_handler also used a allowed_method function, which enable the GET and POST methods and disable all the other.
    
    
    release the code and run the coinsole. Then point the browser to http://localhost:Port(8000).
