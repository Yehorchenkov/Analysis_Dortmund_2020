# Reading from APIs
# Based on https://www.dataquest.io/blog/r-api-tutorial/

library(httr)
library(jsonlite)

# Make a GET request
res = GET("http://api.open-notify.org/astros.json")

# status code 200 corresponds to a successful request
res

# In its current state, the data in the res variable is not usable. 
# The actual data is contained as raw Unicode in the res list, 
# which ultimately needs to be converted into JSON format. 

rawToChar(res$content)

# Convert raw data to a list structure
data = fromJSON(rawToChar(res$content))

# Let's have a look on names of the data list
names(data)

data$people

# ---APIs and Query Parameters---

# What if we wanted to know when the ISS was going to pass 
# over a given location on earth? 
# we'll need to specify the latitude and longitude of the location 
# we're asking about as part of our GET() request.

# Kyiv location is Latitude 50.45466 and Longitude 30.5238

res = GET("http://api.open-notify.org/iss-pass.json", 
          query = list(lat = 50.45466, lon = 30.5238))
res

# Extract data from response
data = fromJSON(rawToChar(res$content))

names(data)

data$response

# transform data to date format
risetime <- as.POSIXct(data$response$risetime, origin = "1970-01-01", tz = Sys.timezone(location = TRUE))
data$response$risetime <- risetime

data$response
