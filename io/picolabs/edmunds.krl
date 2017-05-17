ruleset io.picolabs.edmunds {
  meta {
    configure using account_sid = ""
                    auth_token = ""
    provides
        get_vehicle
  }
 
  global {
    get_vehicle = defaction(vin) {
       base_url = "http://edmunds.mashery.com/api/vehicle/v2/vins/#{vin}"
   //    base_url
       http:get(base_url) with 
         qs = {
           "api_key" : auth_token,
           "fmt" : "json"
         }
   //    http:post(base_url + "Messages.json")
   //         with form = {
   //             "From":from,
   //             "To":to,
   //             "Body":message
   //         }
    }
  }
}