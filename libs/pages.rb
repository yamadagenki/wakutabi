require 'active_record'

class Pages < ActiveRecord::Base
  # テーブル名が命名規則に沿わない場合、
  self.table_name = 'pages' # set_table_nameは古いから注意
end
