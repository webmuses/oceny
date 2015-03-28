Ember.Handlebars.helper 'attendee_link', (attendee, options) =>
  id = attendee.id
  name = Handlebars.Utils.escapeExpression(attendee.name)
  new Handlebars.SafeString("<a href='#/attendees/#{id}'>#{name}</a>")
