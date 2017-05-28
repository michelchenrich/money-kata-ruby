class Object
  def exposes *names
    attr_reader *names
  end 

  def is_initialized_with *argument_names
    class_eval %Q"
      def initialize #{argument_names.join(', ')}
        #{argument_names.map { |argument_name| "@#{argument_name} = #{argument_name}" }.join("\n")}
      end
    "
  end    

  def is_composed_of *collaborator_names
    is_initialized_with *collaborator_names
    exposes *collaborator_names
  end

  def also_responds_to options
    message = options[:message]
    delegated_message = options[:with_method]
    class_eval %Q"
      def #{message.to_s} *arguments
        #{delegated_message.to_s} *arguments
      end
    "
  end

  def specializes options
    general_method = options[:method]
    specialized_method = options[:to]
    predefined_arguments = options[:with_arguments]

    class_eval %Q"
      def #{specialized_method.to_s} *arguments
        #{general_method.to_s} #{[predefined_arguments.join(', '), '*arguments'].join(', ')}
      end
    "
  end

  def delegates options
    message = options[:message]
    delegatee = options[:to]
    class_eval %Q"
      def #{message.to_s} *arguments
        #{delegatee.to_s}.#{message.to_s} *arguments
      end
    "
  end
end
