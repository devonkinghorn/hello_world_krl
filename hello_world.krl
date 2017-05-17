ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello, monkey, __testing
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
    monkey = function(name) {
      "Hello " + (name => name | "monkey")
    }
    __testing = { 
       "queries": [ { "name": "hello", "args": [ "obj" ] },
                           { "name": "__testing" } ],
      "events": [ { "domain": "echo", "type": "hello" },
       { "domain": "echo", "type": "monkey" } ]
    }
  }
  
  rule hello_world {
    select when echo hello
    send_directive("say") with
      something = "Hello World"
  }

  rule hello_monkey {
    select when echo monkey
    pre {
      name = event:attr("name")
    }
    send_directive("say") with
      something = "Hello " + name.defaultsTo("Monkey")
  }
  
}
