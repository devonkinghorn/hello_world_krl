ruleset track_trips {
  meta {
    name "track_trips"
    description <<
A first ruleset for the Quickstart
>>
    author "Devon Kinghorn"
    logging on
    shares hello, monkey, __testing
  }
  
  rule process_trips {
    select when car new_trip
    pre {
      trip_length = event:attr("mileage")
    }
    send_directive("trip") with
      trip_length = trip_length
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
