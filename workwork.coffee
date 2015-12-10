Sortable.collections = ["tasks"]

Meteor.methods

  mockup : ->
    Tasks.remove({})
    Projects.remove({})
    for i in [1..3]
      projectId = Projects.insert newProject("Project #{i}")
      for j in [1..10]
        Tasks.insert newTask(projectId, "Task #{i}.#{j}")


if Meteor.isClient

  @myTimer = new ReactiveTimer()
  myTimer.start 1
  
  AutoForm.debug()



