module Normalizations
  #CONSTANT
  ZIPCODE                  = /[-. )(,]/
  PHONE                    = /[-. )(,]/
  SSN                      = /[-. )(,]/
  TAXID                    = /[-. )(,]/
  DOLLAR                   = /[$, ]/
  NUMBER                   = /[, ]/
  PERCENT                  = /[% ]/
  SPACES                   = /\s/

  module Instance_methods
    def normalize(type)
      if self && self.is_a?(String) && self.match(type)
        self.gsub!(type,'')
      else
        self
      end
    end
  end

end

#extends class
[String, Fixnum, Float, NilClass].each do |klass|
  klass.send(:include, Normalizations::Instance_methods)
end

