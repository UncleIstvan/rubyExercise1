class Main_menu

  def main (task_table)

    case main_prompt

      when 1

        task_table.add_task

        main (task_table)

      when 2

        task_table.mark_completed

        main (task_table)

      when 3

        task_table.delete_task

        main (task_table)

      when 4

        task_table.show_all

        wait

        main (task_table)

      when 5

        task_table.show_completed

        wait

        main (task_table)

      when 6

        task_table.show_pending

        wait

        main (task_table)

      else

        puts "bye!"

    end

  end

def main_prompt
  # outputs "main menu" text prompt
  puts "  Main menu \n
        To add new task, press '1' \n
        To mark existing task as completed, press '2' \n
        To delete existing task, press '3' \n
        To view list of all tasks, press '4' \n
        To view list of all completed tasks, press '5' \n
        To view list of all pending tasks, press '6' \n
        If you want to quit, press any other key \n"

  user_input = gets.to_i # reads number to compare it to options in case
end




# waits for user to enter anything
  def wait

    puts "\n press enter to continue"
    gets

  end

end