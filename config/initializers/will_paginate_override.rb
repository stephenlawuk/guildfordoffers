# Method to override the Will_Paginate gem output method

 module WillPaginate
  module ViewHelpers
    module Base
      def page_entries_info(collection, options = {})

      entry_name = options[:entry_name] || (collection.empty?? 'entry' :
                   collection.first.class.name.underscore.gsub('_', ' '))

      plural_name = if options[:plural_name]
        options[:plural_name]
      elsif entry_name == 'entry'
        plural_name = 'entries'
      elsif entry_name.respond_to? :pluralize
        plural_name = entry_name.pluralize
      else
        entry_name + 's'
      end

      unless options[:html] == false
        b  = '<b>'
        eb = '</b>'
        sp = '&nbsp;'
      else
        b  = eb = ''
        sp = ' '
      end

      if collection.total_pages < 2
        case collection.size
        when 0; "No #{plural_name} found"
        when 1; "Displaying #{b}1#{eb} #{entry_name}"
        else %{Displaying #{plural_name} #{b}%d#{sp}-#{sp}%d#{eb} out of #{b}%d#{eb} results} % [
          collection.offset + 1,
          collection.offset + collection.length,
          collection.total_entries
        ]
        end
      else
        %{Displaying #{plural_name} #{b}%d#{sp}-#{sp}%d#{eb} out of #{b}%d#{eb} results} % [
          collection.offset + 1,
          collection.offset + collection.length,
          collection.total_entries
        ]
      end

      end
    end
  end
end
