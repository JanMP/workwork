Sortable.collections = ["tasks"]

if Meteor.isClient

  @myTimer = new ReactiveTimer()
  myTimer.start 1
  
  AutoForm.debug()


