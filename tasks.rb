class Tasks

  attr_accessor :tasks

  def initialize options
    @id_counter = 0
    @tasks = options [:tasks] || {}
  end


# reads text input and creates new task with that description and assigns ID
  def add_task

    new_description_prompt_print

    increment_task_id_counter

    new_text = gets.chomp

    @tasks[@id_counter] = create_task(new_text)

  end

# reads input and tries to find a task with that id to change its status
  def mark_completed
    puts 'Enter task number(ID), please'

     entered_id = get_id_input

     if @tasks[entered_id]

      @tasks[entered_id].status = 'completed'

     else

       no_entry_message

     end

  end


# reads input and tries to find a task with that id to delete it
  def delete_task

    puts 'Enter task number(ID), please'

    entered_id = get_id_input

    if @tasks[entered_id]

      @tasks.delete(entered_id)

    else

      no_entry_message

    end

  end

  def create_task(text)

    task = Task.new ({

                            text: text

                        })

  end

  # outputs crude table with all tasks in our array
  def show_all

    if @tasks.empty?
    table_empty
    else
    table_placeholder
    fill_table(@tasks)
    end
  end

  # same as above, but shows only tasks with specific status
  def show_only(status_query)

    sorted_tasks = @tasks.select{|task_id, task| task.status == status_query}

    if sorted_tasks.empty?
      table_empty
    else
    table_placeholder
    fill_table(sorted_tasks)
    end
  end


  def get_id_input

    task_id = gets.to_i

  end

  def fill_table (hash)
   hash.each { |task_id, task| puts "#{task_id}  #{task.text}  #{task.status}" }
  end

  def new_description_prompt_print

    puts 'Enter task description, please'

  end

  def table_placeholder

    puts "| Number | \t \t Description \t \t |  Status  | "

  end

  def table_empty

    puts 'Nothing to show yet'

  end

  def increment_task_id_counter
    @id_counter += 1
  end

  def no_entry_message
    puts 'no task with this id found'
  end

end