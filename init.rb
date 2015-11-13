require_relative 'task'
require_relative 'tasks'
require_relative 'mainMenu'

# and another object that acts as collection for our tasks
planned_for_tomorrow = Tasks.new ({})

# creates and launches new instance of our main menu object
main_menu = Main_menu.new

main_menu.main (planned_for_tomorrow)




