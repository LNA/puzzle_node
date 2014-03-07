parser = ParseTravelData.new('/data/sample_input.txt')
flights = parser.remove_extraneous_data
flights = parser.split_travel_data

trips = TripTracker.new(flights)
trips.assign_attributes_to_trips

# parse data
# create flight with proper attributes
# create class to calculate cheapest flight
# create class to calculate fastest flight
# create class to compare the two