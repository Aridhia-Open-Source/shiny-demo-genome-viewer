# A good general policy is to have as much code as possible in
# a separate file or files if the application is big enough.
#
# The reason for structuring the code in this way is to allow you to
# test as much functionality as possible independently of the user
# interface.
#
# Conversely, it also allows you to easily provide fast dummy implementations
# of functions when developing the user interface.

# Require any libraries that are needed for the UI code

# Any functions used in the UI code could go here


# End of UI functions


initialize_app <- function() {
  # Define and initialise functions used in the server code
  #
  # By doing this in a function we can allow the user interface to start
  # up while we are still loading libraries, data, defining functions etc.

  # Load libraries not used by the UI code
  xap.require("dplyr", "ggplot2", "lubridate", "hflights")


  # Methods used by the server can be defined here

  flights.per.month <<- function(cancelled) {
	# Filters the flight data appropriately

    if(cancelled == "not_cancelled") {
      # Filter only flights that where not cancelled.
      flights_info <- hflights %>% filter(Cancelled == 0)

    } else if(cancelled == "cancelled") {
      # Filter only flights that where cancelled.
      flights_info <- hflights %>% filter(Cancelled == 1)

    } else {
      # Do not filter the flights data.
      flights_info <- hflights
    }

    # Summarise flights by month for the visualisation.
    flights_per_month <- flights_info %>% group_by(Month = month(Month, label = TRUE)) %>% summarise(Flights = n())

    # Return the summarised flights table
    return (flights_per_month)
  }

  flights.per.month.plot <<- function(flights_per_month, colour) {
    # Create the ggplot2 visualisation.
    flights_per_month_plot <- ggplot(flights_per_month, aes(x = Month, y = Flights)) +
      geom_bar(stat = "identity", colour = 'black', fill = colour)

    # Return the ggplot2 visualisation
    return (flights_per_month_plot)
  }
}