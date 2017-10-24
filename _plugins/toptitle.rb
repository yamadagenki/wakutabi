module Jekyll
  module TopTitle
    def toptitle(input)
      length = input.length
      return input + '　' * (30 - length) if length < 30
      input
    end
  end
end
Liquid::Template.register_filter(Jekyll::TopTitle)
