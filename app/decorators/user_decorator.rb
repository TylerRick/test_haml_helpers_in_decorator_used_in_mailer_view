require 'pp'

class UserDecorator < Draper::Base
  decorates :user

  def name_and_contact_info
    # An ugly workaround that works:
    Draper::ViewContext.current.class_eval do
      include Haml::Helpers
    end
    Draper::ViewContext.current.instance_eval do
      init_haml_helpers
    end

    Rails.logger.debug %(... Draper::ViewContext.current.class.ancestors=#{(Draper::ViewContext.current.class.ancestors).pretty_inspect.indent(4)})
    Rails.logger.debug %(... Draper::ViewContext.current.method(:capture_haml)=#{(Draper::ViewContext.current.method(:capture_haml)).inspect rescue $!.inspect})

    h.capture_haml do
      h.haml_tag :div, user.name
    end
  end

  # including Haml::Helpers directly into this class is another object, but we want to be consistent
  # and always go through h for our helpers!
  #
#  include Haml::Helpers
#  def name_and_contact_info
#    init_haml_helpers
#    haml_tag :div, user.name
#  end

end

