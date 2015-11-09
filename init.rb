require_relative 'task'
require_relative 'tasks'
require_relative 'mainMenu'

# let's create some test task objects
gardening = Task.new({

                         id_number: 5,
                         text: 'rake fallen leaves',

                     })

repair = Task.new ({

                      id_number: 10,
                      text: 'front door needs fixing',

                  })


# and another object that acts as collection for our tasks
planned_for_tomorrow = Tasks.new ({

                                     tasks: [gardening, repair]

                                 })

# changes ID property of our tasks inside collection to match position in array
planned_for_tomorrow.serialize


# creates and launches new instance of our main menu object
main_menu = Main_menu.new

main_menu.main (planned_for_tomorrow)




