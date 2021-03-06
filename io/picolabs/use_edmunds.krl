ruleset io.picolabs.use_edmunds {
  meta {
    use module io.picolabs.keys
    use module io.picolabs.use_edmunds alias twilio
        with account_sid = keys:twilio("account_sid")
             auth_token =  keys:twilio("auth_token")
  }
 
  rule test_send_sms {
    select when test get_vehicle
    edmunds:get_vehicle(event:attr("vin"))
  }
}
