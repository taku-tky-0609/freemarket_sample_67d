module FormHelper                                                               
  class FormWithErrorMessageBuilder < ActionView::Helpers::FormBuilder
    def input_field_with_error(attribute, options={}, &block)   
      error_messages = @object.errors.full_messages_for(attribute) 
      if error_messages.any?                                                    
        error_contents = create_error_div(attribute, error_messages)            
      end
      block.call + error_contents || ""                                         
    end                                                                                                                               
    def create_error_div(attribute, messages)    
      @template.content_tag(:div, class: "error-class") do
        messages.each do |message|                                              
          @template.concat(@template.content_tag(:div, message))                
        end                                                                     
      end                                                                       
    end

    def fields_for(attribute, options={})
      input_field_with_error(attribute, options) do                             
        super                                                                   
      end                                                                       
    end

    def text_field(attribute, options={})                                       
      input_field_with_error(attribute, options) do                             
         super                                                                   
      end                                                                       
    end

    def number_field(attribute, options={})                                       
      input_field_with_error(attribute, options) do                             
         super                                                                   
      end                                                                       
    end
    
    def telephone_field(attribute, options={})                                       
      input_field_with_error(attribute, options) do                             
         super                                                                   
      end                                                                       
    end

    def collection_select(attribute, array, value, column, options={})                                       
      input_field_with_error(attribute, options) do                             
         super                                                                   
      end                                                                       
    end                                                                 
 
    def password_field(attribute, options={})                                       
      input_field_with_error(attribute, options) do                             
         super                                                                   
      end                                                                       
    end     
  end                                                                         
end    