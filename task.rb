class Task

  attr_accessor  :text, :status

  def initialize (options)

    @text = options [:text] || '' #stores task description
    @status = options [:status] || 'pending'

  end


end