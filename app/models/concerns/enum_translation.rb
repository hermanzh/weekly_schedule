module EnumTranslation
  extend ActiveSupport::Concern

  module ClassMethods
    # overwrite the enum method for adding translation methods
    # ex:
    #   enum role: %w(admin operator)
    #   instance method t_role
    #   class method t_roles
    def enum(definitions)
      super(definitions)
      definitions.each do |name, _|
        Helper._define_attr_translation_method(self, name)
        Helper._define_collection_translation_method(self, name)
      end
    end

    # 本身值就是中文直接返回
    def t_enum(enum_name, enum_value)
      return if enum_value.nil?
      return enum_value if enum_value =~ /[\u4e00-\u9fa5]/
      I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
    end

    def t_enum_collection(enum_name)
      enum_values = send(enum_name.to_s.pluralize).keys
      enum_values.each_with_object({}) do |enum_value, hash|
        hash[t_enum(enum_name, enum_value)] = enum_value
      end
    end
  end

  module Helper
    def self._define_attr_translation_method(klass, attr_name)
      attr_translation_method_name = "t_#{attr_name}"

      klass.class_eval <<-METHOD, __FILE__, __LINE__
        def #{attr_translation_method_name}
          enum_value = self.send(:#{attr_name})
          if enum_value
            self.class.t_enum(:#{attr_name}, enum_value)
          else
            nil
          end
        end
      METHOD
    end

    def self._define_collection_translation_method(klass, attr_name)
      collection_translation_method_name = "t_#{attr_name.to_s.pluralize}"

      klass.instance_eval <<-METHOD, __FILE__, __LINE__
        def #{collection_translation_method_name}
          self.t_enum_collection(:#{attr_name})
        end
      METHOD
    end
  end
end
