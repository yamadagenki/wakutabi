require 'bundler/setup'
require 'active_record'
Bundler.require

require 'kconv'
require 'csv'

Dir[File.expand_path('../libs', __FILE__) << '/*.rb'].each do |file|
  require file
end

require 'csv'
require 'pp'

filename = "./tmp.csv"


def new_line(line)
  line.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z').gsub(/\n/, "").split("。").map{|item| item + "。" + (rand(4) == 0 ? "\n\n" : '') }.join("")
end

CSV.foreach(filename, :col_sep => "\t", :headers => true) do |row|
  next if Pages.exists?(title: row[5])
  total_body = (5..29).step(2).to_a.map{|i| row[i]}.join('').tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
  category = []
  category << 'y2018' if total_body.match(/2018/)
  category << 'lady' if total_body.match(/女/)
  category << 'man' if total_body.match(/男/)
  category << 'spring' if total_body.match(/温泉/)
  category << 'japan' if total_body.match(/日本|国内/)
  category << 'tokyo' if total_body.match(/東京|千葉|埼玉|神奈川|群馬|栃木|山梨/)
  category << 'abroad' if total_body.match(/海外|国外|外国|ヨーロッパ|アメリカ|アジア/)
  Pages.create(
    title: row[5].tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z'),
    category: category.join(','),
    sub_title1: row[9].tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z'),
    body1: new_line(row[13]),
    sub_title2: row[17].tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z'),
    body2: new_line(row[21]),
    sub_title3: row[25].tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z'),
    body3: new_line(row[29])
  )
end
