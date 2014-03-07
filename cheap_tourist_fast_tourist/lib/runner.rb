parser = ParseTravelData.new('/data/sample_input.txt')
parsed_travel_itineraries = parser.remove_extraneous_data
parsed_travel_itineraries = parser.split_travel_data

trip_creator = TripCreator.new(parsed_travel_itineraries)
trip_creator.create_trips

travel_agent = TravelAgent.new(trips)
travel_agent.order_trips_by_price
travel_agent.order_trips_by_time
travel_agent.find_best_trip