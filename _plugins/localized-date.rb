# Language-aware date filters for the bilingual (jekyll-polyglot) site.
#
#   {{ page.date | localized_date: 'short' }}  en: "Oct 05, 2026"     de: "05.10.2026"
#   {{ page.date | localized_date: 'long' }}   en: "October 05, 2026" de: "5. Oktober 2026"
#   {{ page.date | localized_date: 'month' }}  en: "Oct 2026"         de: "Okt. 2026"
#   {{ content.startDate | cv_date }}          en: "2024.02"          de: "02/2024"
#   {{ content.date | cv_date: 'day' }}         en: "2024.02.01"       de: "01.02.2024"
#
# The language is taken from the page's `lang` front matter, falling back to
# the language polyglot is currently building.
require 'date'

module Jekyll
  module LocalizedDateFilter
    DE_MONTHS = %w[Januar Februar März April Mai Juni Juli August September Oktober November Dezember].freeze
    DE_MONTHS_ABBR = ['Jan.', 'Feb.', 'März', 'Apr.', 'Mai', 'Juni', 'Juli', 'Aug.', 'Sept.', 'Okt.', 'Nov.', 'Dez.'].freeze

    def localized_date(input, style = 'short')
      date = to_date(input)
      return input if date.nil?

      if german?
        case style.to_s
        when 'long' then "#{date.day}. #{DE_MONTHS[date.month - 1]} #{date.year}"
        when 'month' then "#{DE_MONTHS_ABBR[date.month - 1]} #{date.year}"
        else date.strftime('%d.%m.%Y')
        end
      else
        case style.to_s
        when 'long' then date.strftime('%B %d, %Y')
        when 'month' then date.strftime('%b %Y')
        else date.strftime('%b %d, %Y')
        end
      end
    end

    # CV dates are stored as "YYYY-MM-DD" (or "YYYY-MM"); anything else
    # (e.g. "ongoing", "laufend") is passed through unchanged.
    # With 'day' the full date is kept: en "2024.02.01", de "01.02.2024".
    def cv_date(input, style = 'month')
      str = input.to_s.strip
      m = str.match(/\A(\d{4})-(\d{2})(?:-(\d{2}))?\z/)
      return input unless m

      if style.to_s == 'day' && m[3]
        german? ? "#{m[3]}.#{m[2]}.#{m[1]}" : "#{m[1]}.#{m[2]}.#{m[3]}"
      else
        german? ? "#{m[2]}/#{m[1]}" : "#{m[1]}.#{m[2]}"
      end
    end

    private

    def german?
      page = @context.registers[:page] || {}
      site = @context.registers[:site]
      lang = page['lang']
      lang = site.active_lang if (lang.nil? || lang.to_s.empty?) && site.respond_to?(:active_lang)
      lang = site.config['default_lang'] if lang.nil? || lang.to_s.empty?
      lang.to_s == 'de'
    end

    def to_date(input)
      case input
      when Date, Time, DateTime then input
      when nil, '' then nil
      else
        Liquid::Utils.to_date(input) || (Date.parse(input.to_s) rescue nil)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LocalizedDateFilter)
