module Validations
    def self.included(base)
        self.class_variable_set :@@validations, Hash.new
        base.extend ClassMethods
        base.send :include, InstanceMethods
    end

    module ClassMethods

        def validations
         class_variable_get :@@validations
        end

        def validate(validation_type, *args)
            validations[validation_type] = args
        end
    end

    module InstanceMethods
        def validate!
            self.class.class_variable_get("@@validations").each do |type, value|
                send type, instance_variable_get("@#{value[0]}"), value[1]
            end
            true
        end

        def valid?
            validate!
        rescue RuntimeError => e
            puts e.message
            false
        end

        private

        def presence(val, empty)
            puts val
            raise "Значение атрибута не должно быть nil или пустой строкой" if val.nil? || val == ""
        end

        def format(val, validation_format)
            puts val
            puts validation_format
          raise "Неверный формат" if val !~ validation_format
        end

        def type(val, validation_class)
          raise "Неверный класс" unless val.class == validation_class
        end
    end
end
