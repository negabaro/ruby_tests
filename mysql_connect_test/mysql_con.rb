require 'mysql2'

connection = Mysql2::Client.new({
          :host => '127.0.0.1',
          :port => '3306',
          :username => 'root',
          :password => 'mysql',
          :database => 'filmarks_staging',
          #:encoding => @encoding,
          :reconnect => true,
          :stream => true,
          :cache_rows => false
        })

# 文字コードをUTF8に設定
#connection.query("set character set utf8")

# DBに問い合わせ
#rs = connection.query("CREATE TABLE filmarks_staging.skills3(id int auto_increment, name varchar(20), url varchar(40),primary key(id));")
#rs = connection.query("CREATE TEMPORARY TABLE tmp_member_skill3 SELECT members.id AS member_id,skills.name AS skill_name,skills.url AS skill_url FROM members LEFT JOIN member_skill_relation ON members.id = member_id LEFT JOIN skills ON skills.id = skill_id;")
rs = connection.query("CREATE TABLE tmp_member_skill3 SELECT members.id AS member_id,skills.name AS skill_name,skills.url AS skill_url FROM members LEFT JOIN member_skill_relation ON members.id = member_id LEFT JOIN skills ON skills.id = skill_id;")

puts rs
# 検索結果を表示
#rs.each do |r|
#  puts r.join ", "
#end

# コネクションを閉じる
connection.close
