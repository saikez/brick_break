# frozen_string_literal: true

# Listen carefully...
#
module Listenable
  def listeners
    @listeners ||= []
  end

  def add_listener(listener)
    listeners << listener
  end

  def remove_listener(listener)
    listeners.delete(listener)
  end

  def notify_listeners(event_name, *args)
    listeners.each do |listener|
      listener.send(event_name, *args) if listener.respond_to? event_name
    end
  end
end
