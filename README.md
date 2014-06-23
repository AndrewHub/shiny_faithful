shiny_faithful
==============

Codes for my shiny_faithful app.

This is a simple shiny app created for tourists coming to see the wonderful eruption of Old Faithful Geyser in Yellowstone National Park. People could know the eruption duration and time interval of the last eruption easily from information desk of Old Faithful. 

By entering Last Eruption Duration in minutes, the app would calculate the possible waiting time based on historical data. People could have an idea of whether they need to sit in front of the Old Faithful or walk around and come back right to see the eruption.

By entering Last Group Waiting Time in minutes, the app would calculate the next possible eruption time based on historical data. People then would expect how wonderful the Old Faithful they will experience at next eruption and plan for future waitings.

I also create an interactive plot to visually represent the model and let tourist have better understanding of the predictive model. 

The app use data from Härdle, W. (1991) Smoothing Techniques with Implementation in S. New York: Springer. Azzalini, A. and Bowman, A. W. (1990). A look at some data on the Old Faithful geyser. Applied Statistics 39, 357–365. The models used in the app are linear regression models, with a R-squared around 0.8.
