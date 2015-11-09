class Task

  attr_accessor :id_number, :text, :completed

  def initialize (options)
    @id_number = options [:id_number] || 1
    @text = options [:text] || '' #stores task description
    @completed = options [:completed]

  end

  def status

    if @completed

      'completed'

    else

      'pending'

    end

  end


end