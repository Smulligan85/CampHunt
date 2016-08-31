# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show page rendered using jQuery and an Active Model Serialization JSON backend.
    On each trip show page a button allows the user to preview the next trip and
    provides a link to its show page.
- [x] Include an index page rendered using jQuery and an Active Model Serialization JSON backend.
    See Upcoming Trips button on user show page renders index of all trips and
    filters with Trip.prototype.upcoming
- [x] Include at least one has_many relationship in information rendered via JSON
    One trip show page New Supply form renders a trip has_many supplies via
    JSON
- [x] Include at least one link that loads or updates a resource without reloading the page
    Both See Upcoming Trips and More Info button on Trip index page renders
    resource
- [x] Translate JSON responses into js model objects
    trip controller action JSON responses translated into Trip js objects.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype
    Trip.prototype.upcoming

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
