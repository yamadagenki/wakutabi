module Jekyll
  module Slug2Name
    def slug2name(input)
      translate = {
        'japan' => '国内旅行',
        'y2018' => '2018年おすすめ',
        'tokyo' => '東京近郊',
        'spring' => '温泉',
        'lady' => '女子旅'
      }
      input.map(&:to_s).uniq.map{|item| translate[item]}.join(',')
    end
  end
end
Liquid::Template.register_filter(Jekyll::Slug2Name)
