class Tasks

  attr_accessor :tasks


  def initialize options
    @tasks = options [:tasks] || []
  end

# changes task ID properties according to their position in array
  def serialize
    @tasks.each { |task| task.id_number = tasks.index(task) + 1 }
  end

# reads text input and creates new task with that description
# assigns ID and puts this task at the end of our task array
  def add_task
    puts 'Enter task description, please'
    new_text = gets.chomp

    new_task = Task.new ({

                            id_number: @tasks.size+1,
                            text: new_text,

                        })
    @tasks << new_task

  end

# reads number input and tries to limit it to our task array range
# if there's a task with that index in our array, it changes "completed" property to true
  def mark_completed
    puts 'Enter task number(ID), please'

    task_index = gets.to_i - 1

    if task_index >= 0 && task_index <= @tasks.size

      @tasks[task_index].completed = true
    end
  end


# reads number input and tries to limit it to our task array range
# if there's a task with that index in our array, it deletes this task,
#  and changes IDs of other tasks according to our array structure
  def delete_task

    puts 'Enter task number(ID), please'

    task_index = gets.to_i - 1

    if task_index >= 0 && task_index <= @tasks.size

      @tasks.delete_at(task_index)

      serialize

    end

  end

  # outputs crude table with all tasks in our array
  def show_all

    if @tasks.empty?
    table_empty
    else
    table_placeholder
    @tasks.each { |task| puts "#{task.id_number}  #{task.text}  #{task.status}" }
    end
  end

  # same as above, but shows only tasks with "COMPLETED" status
  def show_completed
    if @tasks.empty?
      table_empty
    else
    table_placeholder
    @tasks.each { |task| puts "#{task.id_number}  #{task.text}  #{task.status}" if task.completed }
    end
  end

  # same as above, but shows only tasks with "PENDING" status
  def show_pending
    if  @tasks.empty?
      table_empty
    else
    table_placeholder
    @tasks.each { |task| puts "#{task.id_number}  #{task.text}  #{task.status}" unless task.completed }
    end
  end

  def table_placeholder

    puts "| Number | \t \t Description \t \t |  Status  | "

  end

  def table_empty

    puts 'Nothing to show yet'

  end
end