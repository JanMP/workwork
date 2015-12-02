FlowRouter.route "/",
  action : ->
    BlazeLayout.render "layout",
      content : "about"

FlowRouter.route "/lists",
  action : ->
    BlazeLayout.render "layout",
      content : "lists"

FlowRouter.route "/timers",
  action : ->
    BlazeLayout.render "layout",
      content : "timers"

FlowRouter.route "/logs",
  action : ->
    BlazeLayout.render "layout",
      content : "logs"

FlowRouter.route "/settings",
  action : ->
    BlazeLayout.render "layout",
      content : "settings"

FlowRouter.route "/help",
  action : ->
    BlazeLayout.render "layout",
      content : "help"